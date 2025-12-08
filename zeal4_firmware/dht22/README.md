# DHT11/DHT22 Sensor Firmware with MQTT Integration

This directory contains Arduino firmware designed for ESP32/ESP8266 microcontrollers to read data from DHT11 or DHT22 temperature and humidity sensors. It utilizes SmartConfig for easy Wi-Fi provisioning and publishes the sensor readings to an MQTT broker.

## Features

-   **DHT Sensor Reading**: Accurately reads temperature and humidity from DHT11 or DHT22 sensors.
-   **SmartConfig Provisioning**: Allows for seamless Wi-Fi credential setup using a mobile application.
-   **MQTT Communication**: Publishes sensor data to a configurable MQTT topic.
-   **NTP Time Synchronization**: Obtains current time via NTP for accurate timestamping of sensor data.
-   **Automatic MQTT Reconnection**: Ensures continuous data publishing even after temporary MQTT broker disconnections.

## Hardware Requirements

-   ESP32 or ESP8266 development board (e.g., NodeMCU, Wemos D1 Mini)
-   DHT11 or DHT22 Temperature and Humidity Sensor
-   Jumper wires for connecting the sensor to the ESP board

## Software Requirements

-   [Arduino IDE](https://www.arduino.cc/en/software)
-   **ESP32/ESP8266 Board Package** for Arduino IDE (install via Boards Manager)
-   **Libraries**:
    -   `Preferences` (ESP32/ESP8266 built-in)
    -   `WiFi` (ESP32/ESP8266 built-in)
    -   `NTPClient` ([Adafruit_NTPClient](https://github.com/arduino-libraries/NTPClient))
    -   `PubSubClient` ([PubSubClient by Nick O'Leary](https://github.com/knolleary/pubsubclient))
    -   `Adafruit Unified Sensor` ([Adafruit Unified Sensor](https://github.com/adafruit/Adafruit_Unified_Sensor))
    -   `DHT sensor library` ([Adafruit DHT Unified Sensor](https://github.com/adafruit/DHT-sensor-library))

## Configuration Steps

### 1. Arduino IDE Setup

1.  **Install Board Package**: Open Arduino IDE, go to `File` -> `Preferences`, and add the URL for ESP32/ESP8266 boards manager. Then, go to `Tools` -> `Board` -> `Boards Manager` and install the `esp32` or `esp8266` platform.
2.  **Install Libraries**: Go to `Sketch` -> `Include Library` -> `Manage Libraries...` and search for and install the required libraries listed above.

### 2. Wiring the DHT Sensor

Connect the DHT sensor to your ESP board. A typical wiring for a DHT22 sensor to an ESP32:

-   **DHT VCC** to **ESP 3.3V / 5V** (check your DHT sensor's voltage requirements)
-   **DHT GND** to **ESP GND**
-   **DHT Data Pin** to **ESP GPIO4** (as defined by `DHTPIN` in the code, can be changed)

### 3. SmartConfig Provisioning

The firmware is configured to use SmartConfig. On first boot or if Wi-Fi credentials are lost, the ESP device will enter SmartConfig mode:

1.  Upload the `dht22_smart_config.ino` code to your ESP board.
2.  Open the Serial Monitor (9600 baud) to observe the device's status.
3.  When the device prints "Waiting for SmartConfig.", use a compatible mobile app (e.g., [ESP-TOUCH for Android](https://play.google.com/store/apps/details?id=com.Espressif.Esptouch&hl=en_US) or [ESP-TOUCH for iOS](https://apps.apple.com/us/app/esp-touch/id1071176700)) to send your Wi-Fi credentials to the device.

### 4. MQTT Broker Configuration

Before uploading the code, adjust the MQTT settings in `dht22_smart_config.ino`:

-   `#define MQTT_SERVER "192.168.1.38"`: **Change this to the IP address or hostname of your MQTT broker.**
-   `#define MQTT_NAME "ESP32_DHT"`: A unique name for your device on the MQTT broker.
-   `#define MQTT_USERNAME "ESP32_DHT"`: MQTT username (if required by your broker).
-   `#define MQTT_PASSWORD ""`: MQTT password (if required by your broker).

### 5. Upload Firmware

Upload the modified `dht22_smart_config.ino` sketch to your ESP board using the Arduino IDE.

## MQTT Topic and Payload Format

The firmware publishes temperature and humidity data to a Tasmota-like topic for compatibility with the `zeal4_etl` service.

**Example Topic:**
`tele/ESP32_DHT/SENSOR` (where `ESP32_DHT` matches your `MQTT_NAME` define)

**Example Payload (JSON):**
```json
{
  "DHT22": {
    "temperature": 25.50,
    "humidity": 60.20
  },
  "Time": "2025-12-08T05:24:26"
}
```
The `zeal4_etl` service is configured to process messages from `tele/+/SENSOR` topics, extract the sensor data (e.g., "DHT22"), and incorporate the `Time` field as a Unix timestamp for storage.