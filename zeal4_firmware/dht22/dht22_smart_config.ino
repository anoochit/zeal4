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
#define MQTT_SERVER "192.168.1.38" // CHANGE THIS TO YOUR MQTT BROKER IP
#define MQTT_PORT 1883
#define MQTT_NAME "ESP32_DHT"
#define MQTT_USERNAME "ESP32_DHT"
#define MQTT_PASSWORD ""
WiFiClient espClient;
PubSubClient mqtt(espClient);

// DHT specific includes
#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <DHT_U.h>

// DHT sensor defines
#define DHTPIN 4     // Digital pin connected to the DHT sensor (e.g., GPIO4)
#define DHTTYPE DHT22 // DHT 11 or DHT 22

DHT_Unified dht(DHTPIN, DHTTYPE); // DHT sensor object

// chip id
uint32_t chipId = 0;

void setup() {
  // Disable brownout detector
  WRITE_PERI_REG(RTC_CNTL_BROWN_OUT_REG, 0);
  Serial.begin(9600);

  // Show Chip id
  for (int i = 0; i < 17; i = i + 8) {
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
    while (!WiFi.smartConfigDone()) {
      delay(500);
      Serial.print(".");
    }

    Serial.println("");
    Serial.println("SmartConfig received.");

    // Wait for WiFi to connect to AP
    Serial.println("Waiting for WiFi");
    while (WiFi.status() != WL_CONNECTED) {
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

    // init sensors and MQTT
    initSensor();
  } else {
    Serial.println("WiFi Connected");

    // init sensors and MQTT
    initSensor();
  }
}

void initSensor() {
  // Init NTP with GMT+7 (Asia/Bangkok offset)
  timeClient.begin();
  timeClient.setTimeOffset(25200); // GMT+7 = 7 hours * 3600 seconds/hour

  // Initialize DHT device.
  dht.begin();
  // Print sensor details.
  sensor_t sensor;
  dht.temperature().getSensor(&sensor);
  Serial.println(F("------------------------------------\n"));
  Serial.println(F("Temperature Sensor\n"));
  Serial.print(F("Sensor Type: ")); Serial.println(sensor.name);
  Serial.print(F("Driver Ver:  ")); Serial.println(sensor.version);
  Serial.print(F("Unique ID:   ")); Serial.println(sensor.sensor_id);
  Serial.print(F("Max Value:   ")); Serial.print(sensor.max_value); Serial.println(F("°C\n"));
  Serial.print(F("Min Value:   ")); Serial.print(sensor.min_value); Serial.println(F("°C\n"));
  Serial.print(F("Resolution:  ")); Serial.print(sensor.resolution); Serial.println(F("°C\n"));
  Serial.println(F("------------------------------------\n"));
  dht.humidity().getSensor(&sensor);
  Serial.println(F("Humidity Sensor\n"));
  Serial.print(F("Sensor Type: ")); Serial.println(sensor.name);
  Serial.print(F("Driver Ver:  ")); Serial.println(sensor.version);
  Serial.print(F("Unique ID:   ")); Serial.println(sensor.sensor_id);
  Serial.print(F("Max Value:   ")); Serial.print(sensor.max_value); Serial.println(F("%\n"));
  Serial.print(F("Min Value:   ")); Serial.print(sensor.min_value); Serial.println(F("%\n"));
  Serial.print(F("Resolution:  ")); Serial.print(sensor.resolution); Serial.println(F("%\n"));
  Serial.println(F("------------------------------------\n"));

  // init mqtt
  mqtt.setServer(MQTT_SERVER, MQTT_PORT);
  mqtt.setCallback(callback);
  reconnectMqtt(); // Ensure MQTT is connected on startup
}

void callback(char *topic, byte *payload, unsigned int length) {
  payload[length] = '\0';
  String topic_str = topic, payload_str = (char *)payload;
  Serial.println("[" + topic_str + "]: " + payload_str);
}

void reconnectMqtt() {
  // Loop until we're reconnected
  while (!mqtt.connected()) {
    Serial.print("Attempting MQTT connection...");
    // Attempt to connect
    if (mqtt.connect(MQTT_NAME, MQTT_USERNAME, MQTT_PASSWORD)) {
      Serial.println("connected");
      // Optionally, subscribe to a command topic here if needed
    } else {
      Serial.print("failed, rc=");
      Serial.print(mqtt.state());
      Serial.println(" trying again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

void loop() {
  if (!mqtt.connected()) {
    reconnectMqtt();
  }
  mqtt.loop();

  delay(2000); // Small delay before reading sensor

  // Get temperature event and print its value.
  sensors_event_t event;
  dht.temperature().getEvent(&event);
  float temperature = event.temperature;

  // Get humidity event and print its value.
  dht.humidity().getEvent(&event);
  float humidity = event.relative_humidity;

  if (isnan(temperature) || isnan(humidity)) {
    Serial.println("Error reading from DHT sensor!");
  } else {
    Serial.print("Temp: ");
    Serial.print(temperature);
    Serial.print(" *C\tHumidity: ");
    Serial.print(humidity);
    Serial.println(" %");

    timeClient.update(); // Update NTP time
    long timestamp = timeClient.getEpochTime();

    // Construct the JSON message string
    // Assuming the ETL expects a "DHT22" sensor ID, and the values within it
    String message = "{\"DHT22\":{\"temperature\": " + String(temperature, 2) + ", \"humidity\": " + String(humidity, 2) + "}, \"Time\":\"" + timeClient.getFormattedTime() + "\"}";
    String topic = "tele/" + String(MQTT_NAME) + "/SENSOR"; // Using Tasmota-like topic for ETL compatibility

    Serial.println("Sending data to topic = " + topic + " = " + message);

    // Publish the MQTT message
    mqtt.publish(topic.c_str(), message.c_str());
  }

  // Delay before next reading/publish cycle
  delay(30000); // Publish every 30 seconds
}
