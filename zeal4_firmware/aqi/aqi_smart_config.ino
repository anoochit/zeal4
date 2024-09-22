// include preferences
#include <Preferences.h>
Preferences prefs;

// rtc control
#include "soc/soc.h"
#include "soc/rtc_cntl_reg.h"

// include wifi
#include "WiFi.h"
String ssid;
String pss;

// ntp
#include <NTPClient.h>
#include <WiFiUdp.h>
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP);

// mqtt
#include <PubSubClient.h>
#define MQTT_SERVER "192.168.1.38"
#define MQTT_PORT 1883
#define MQTT_NAME "ESP32_1"
#define MQTT_USERNAME "ESP32_1"
#define MQTT_PASSWORD ""
WiFiClient client;
PubSubClient mqtt(client);

// include PMS7003
#include "PMS.h"
#include <SPI.h>
HardwareSerial SerialPMS(1);
PMS pms(SerialPMS);
PMS::DATA data;
#define RXD2 26
#define TXD2 25

// chip id
uint32_t chipId = 0;

void setup()
{
  // Disable brownout detector
  WRITE_PERI_REG(RTC_CNTL_BROWN_OUT_REG, 0);
  Serial.begin(9600);

  // Show Chip id
  for (int i = 0; i < 17; i = i + 8)
  {
    chipId |= ((ESP.getEfuseMac() >> (40 - i)) & 0xff) << i;
  }

  Serial.printf("ESP32 Chip model = %s Rev %d\n", ESP.getChipModel(), ESP.getChipRevision());
  Serial.print("Chip ID: ");
  Serial.println(chipId);
  Serial.print("Mac Address: ");
  Serial.println(WiFi.macAddress());

  delay(3000);

  // Init preferences
  prefs.begin("esp32", false);

  // Get ssid and password
  ssid = prefs.getString("ssid", "");
  pss = prefs.getString("pss", "");
  // Serial.print("SSID = ");
  // Serial.println(ssid);
  // Serial.print("pss = ");
  // Serial.println(pss);

  // Connect to WiFi
  WiFi.begin(ssid.c_str(), pss.c_str());
  delay(3500); // Wait for a while till ESP connects to WiFi

  if (WiFi.status() != WL_CONNECTED) // if WiFi is not connected
  {
    // Init WiFi as Station, start SmartConfig
    WiFi.mode(WIFI_AP_STA);
    WiFi.beginSmartConfig();

    // Wait for SmartConfig packet from mobile
    Serial.println("Waiting for SmartConfig.");
    while (!WiFi.smartConfigDone())
    {
      delay(500);
      Serial.print(".");
    }

    Serial.println("");
    Serial.println("SmartConfig received.");

    // Wait for WiFi to connect to AP
    Serial.println("Waiting for WiFi");
    while (WiFi.status() != WL_CONNECTED)
    {
      delay(500);
      Serial.print(".");
    }

    Serial.println("WiFi Connected.");

    Serial.print("IP Address: ");
    Serial.println(WiFi.localIP());

    // Read the connected WiFi SSID and password
    ssid = WiFi.SSID();
    pss = WiFi.psk();
    Serial.print("SSID:");
    Serial.println(ssid);
    Serial.print("PSS:");
    Serial.println(pss);

    // Store ssid, pss to flash
    Serial.println("Store SSID & PSS in Flash");
    prefs.putString("ssid", ssid);
    prefs.putString("pss", pss);

    // init sensors
    initSensor();
  }
  else
  {
    Serial.println("WiFi Connected");

    // init sensor
    initSensor();
  }
}

void initSensor()
{

  // Init NTP with GMT+7
  timeClient.begin();
  timeClient.setTimeOffset(25200);
  timeClient.update();

  // Initialize PMS device.
  SerialPMS.begin(9600, SERIAL_8N1, RXD2, TXD2);
  pms.passiveMode();

  // init mqtt
  mqtt.setServer(MQTT_SERVER, MQTT_PORT);
  mqtt.setCallback(callback);

  while (!mqtt.connected())
  {
    Serial.print("MQTT connection... ");
    if (mqtt.connect(MQTT_NAME, MQTT_USERNAME, MQTT_PASSWORD))
    {
      Serial.println("connected");
    }
    else
    {
      Serial.println("failed");
      delay(2000);
    }
  }
}

void callback(char *topic, byte *payload, unsigned int length)
{
  payload[length] = '\0';
  String topic_str = topic, payload_str = (char *)payload;
  Serial.println("[" + topic_str + "]: " + payload_str);
}

void loop()
{

  // read aqi sensor
  Serial.println("Waking up, wait 30 seconds for stable readings...");
  pms.wakeUp();
  delay(30000);

  Serial.println("Send read request...");
  pms.requestRead();

  Serial.println("Wait max. 1 second for read...");
  if (pms.readUntil(data))
  {
    Serial.print("PM 1.0 (ug/m3): ");
    Serial.println(data.PM_AE_UG_1_0);

    Serial.print("PM 2.5 (ug/m3): ");
    Serial.println(data.PM_AE_UG_2_5);

    Serial.print("PM 10.0 (ug/m3): ");
    Serial.println(data.PM_AE_UG_10_0);

    // Convert PM values to strings
    String pm10String = String(data.PM_AE_UG_1_0);
    String pm25String = String(data.PM_AE_UG_2_5);
    String pm100String = String(data.PM_AE_UG_10_0);

    // Construct the JSON message string
    String message = "{\"pm10\": " + pm10String + ", \"pm25\": " + pm25String + ", \"pm100\": " + pm100String + ", \"timestamp\" : " + timeClient.getEpochTime() + " }";
    String topic = "/device/" + String(chipId) + "/msg";

    if (mqtt.connected() == false)
    {
      Serial.print("MQTT connection... ");
      if (mqtt.connect(MQTT_NAME, MQTT_USERNAME, MQTT_PASSWORD))
      {
        Serial.println("connected");
      }
      else
      {
        Serial.println("failed");
        delay(5000);
      }
    }

    Serial.println("send data to topic = " + topic + " = " + message);

    // Publish the MQTT message
    mqtt.publish(topic.c_str(), message.c_str());
    delay(3000);
  }
  else
  {
    Serial.println("No data.");
  }

  Serial.println("Going to sleep for 60 seconds.");
  pms.sleep();
  delay(60000);

  mqtt.loop();
}