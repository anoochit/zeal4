# AQI (PMS7003) Sensor Firmware with MQTT Integration

This directory contains Arduino firmware designed for ESP32/ESP8266 microcontrollers to read data from PMS7003 (or similar PMS series) Air Quality Index sensors. It utilizes SmartConfig for easy Wi-Fi provisioning and publishes the sensor readings to an MQTT broker.

## Features

-   **PMS Sensor Reading**: Accurately reads PM1.0, PM2.5, and PM10 particulate matter concentrations from PMS7003 (or compatible) sensors.
-   **SmartConfig Provisioning**: Allows for seamless Wi-Fi credential setup using a mobile application.
-   **MQTT Communication**: Publishes sensor data to a configurable MQTT topic.
-   **NTP Time Synchronization**: Obtains current time via NTP for accurate timestamping of sensor data.
-   **Sensor Sleep/Wake Cycle**: Manages the PMS sensor's power state to prolong its lifespan and reduce power consumption.

## Hardware Requirements

-   ESP32 or ESP8266 development board (e.g., NodeMCU, Wemos D1 Mini)
-   PMS7003 (or PMS5003, PMSA003, etc.) Air Quality Index Sensor
-   Jumper wires for connecting the sensor to the ESP board

## Software Requirements

-   [Arduino IDE](https://www.arduino.cc/en/software)
-   **ESP32/ESP8266 Board Package** for Arduino IDE (install via Boards Manager)
-   **Libraries**:
    -   `Preferences` (ESP32/ESP8266 built-in)
    -   `WiFi` (ESP32/ESP8266 built-in)
    -   `NTPClient` ([Adafruit_NTPClient](https://github.com/arduino-libraries/NTPClient))
    -   `PubSubClient` ([PubSubClient by Nick O'Leary](https://github.com/knolleary/pubsubclient))
    -   `PMS` ([PMS library by Xose Pérez](https://github.xose.net/PmsSensor/)) - This library is specific to handling PMS sensors.

## Configuration Steps

### 1. Arduino IDE Setup

1.  **Install Board Package**: Open Arduino IDE, go to `File` -> `Preferences`, and add the URL for ESP32/ESP8266 boards manager. Then, go to `Tools` -> `Board` -> `Boards Manager` and install the `esp32` or `esp8266` platform.
2.  **Install Libraries**: Go to `Sketch` -> `Include Library` -> `Manage Libraries...` and search for and install the required libraries listed above.

### 2. Wiring the PMS7003 Sensor

Connect the PMS7003 sensor to your ESP board. PMS sensors typically use a UART interface for communication.

-   **PMS7003 TX** to **ESP RX2** (e.g., GPIO26 as defined by `RXD2` in the code)
-   **PMS7003 RX** to **ESP TX2** (e.g., GPIO25 as defined by `TXD2` in the code)
-   **PMS7003 VCC** to **ESP 5V**
-   **PMS7003 GND** to **ESP GND**

_Note: The specific GPIO pins `RXD2` and `TXD2` are defined in the `aqi_smart_config.ino` and refer to the second hardware serial port on ESP32. Ensure these match your actual wiring._

### 3. SmartConfig Provisioning

The firmware is configured to use SmartConfig. On first boot or if Wi-Fi credentials are lost, the ESP device will enter SmartConfig mode:

1.  Upload the `aqi_smart_config.ino` code to your ESP board.
2.  Open the Serial Monitor (9600 baud) to observe the device's status.
3.  When the device prints "Waiting for SmartConfig.", use a compatible mobile app (e.g., [ESP-TOUCH for Android](https://play.google.com/store/apps/details?id=com.Espressif.Esptouch&hl=en_US) or [ESP-TOUCH for iOS](https://apps.apple.com/us/app/esp-touch/id1071176700)) to send your Wi-Fi credentials to the device.

### 4. MQTT Broker Configuration

Before uploading the code, adjust the MQTT settings in `aqi_smart_config.ino`:

-   `#define MQTT_SERVER "192.168.1.38"`: **Change this to the IP address or hostname of your MQTT broker.**
-   `#define MQTT_PORT 1883`: Default MQTT port.
-   `#define MQTT_NAME "ESP32_1"`: A unique name for your device on the MQTT broker.
-   `#define MQTT_USERNAME "ESP32_1"`: MQTT username (if required by your broker).
-   `#define MQTT_PASSWORD ""`: MQTT password (if required by your broker).

### 5. Upload Firmware

Upload the modified `aqi_smart_config.ino` sketch to your ESP board using the Arduino IDE.

## MQTT Topic and Payload Format

The firmware publishes AQI data to a topic that the `zeal4_etl` service is configured to process.

**Example Topic:**
`/device/<chipId>/msg` (where `<chipId>` is the unique ID of your ESP32)

**Example Payload (JSON):**
```json
{
  "pm10": 13,
  "pm25": 15,
  "pm100": 15,
  "timestamp": 1726031393
}
```
The `zeal4_etl` service is designed to process messages from `/device/+/msg` topics, extract the sensor data (in this case, PM values), and process the `timestamp` field for storage.