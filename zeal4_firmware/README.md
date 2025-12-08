# Firmware for Zeal4 IoT Devices

This directory (`zeal4_firmware/`) serves as a central repository for various microcontroller firmware projects designed to integrate with the Zeal4 IoT platform. Each subdirectory typically contains firmware for a specific sensor or device type, along with instructions on how to set it up to communicate with the `zeal4_etl` service via MQTT.

## Overview

The firmware here is primarily developed for ESP32/ESP8266 microcontrollers using the Arduino IDE framework. Key features often include:
-   **Wi-Fi Connectivity**: Utilizing SmartConfig or hardcoded credentials for network access.
-   **NTP Time Synchronization**: Ensuring accurate timestamps for sensor data.
-   **MQTT Communication**: Publishing sensor readings to a central MQTT broker for ingestion by `zeal4_etl`.
-   **Sensor Integration**: Code examples and configurations for various environmental sensors.

## Sub-Modules

### `aqi/` - Air Quality Index Sensor Firmware
Contains Arduino firmware for Air Quality Index (AQI) sensors, specifically focusing on the PMS series (e.g., PMS7003, PMS5003). This firmware integrates SmartConfig for Wi-Fi provisioning and sends PM (Particulate Matter) data to an MQTT broker.
-   **Detailed instructions**: Refer to [`aqi/README.md`](./aqi/README.md) for wiring, configuration, and usage.

### `dht22/` - DHT11/DHT22 Temperature & Humidity Sensor Firmware
Contains Arduino firmware for DHT11 or DHT22 temperature and humidity sensors. Similar to the AQI firmware, it uses SmartConfig for network setup and publishes temperature and humidity data to an MQTT broker.
-   **Detailed instructions**: Refer to [`dht22/README.md`](./dht22/README.md) for wiring, configuration, and usage.

### `smart_config/` - Smart Config Utilities
This directory is dedicated to generic Smart Config firmware or examples. Smart Config is a provisioning method allowing easy Wi-Fi credential setup for IoT devices via a mobile application. Firmware placed here should enable devices to enter a listening mode for these credentials.
-   **Detailed instructions**: Refer to [`smart_config/README.md`](./smart_config/README.md) for an overview of Smart Config and its usage.

### `tasmota/` - Tasmota Firmware Configurations
This section contains configuration examples and potentially custom builds for devices running Tasmota firmware. Tasmota is an open-source firmware for ESP devices that provides extensive sensor support and MQTT integration out-of-the-box. Here you'll find guidance on configuring Tasmota to connect specific sensors (e.g., AQI sensors) and publish data to the MQTT broker in a format compatible with `zeal4_etl`.
-   **Detailed instructions**: Refer to [`tasmota/README.md`](./tasmota/README.md) for Tasmota-specific configuration for AQI sensors.

## General Setup

To work with the firmware in this module:
1.  **Install Arduino IDE**: Download and install the [Arduino IDE](https://www.arduino.cc/en/software).
2.  **ESP32/ESP8266 Board Support**: Add the respective board packages to your Arduino IDE via the Boards Manager.
3.  **Install Libraries**: Install all necessary libraries mentioned in the individual `README.md` files (e.g., `PubSubClient`, `NTPClient`, sensor-specific libraries like `Adafruit Unified Sensor`, `DHT`, `PMS`).

## MQTT Integration

All firmware examples are designed to publish sensor data to an MQTT broker. The `zeal4_etl` service (located in the `zeal4_etl/` directory of this project) subscribes to these MQTT topics, processes the incoming data, and stores it in the Serverpod backend. Ensure your MQTT broker (e.g., Mosquitto, typically run via `zeal4_server/docker-compose.yaml`) is running and accessible to your devices.

## Contributing

If you develop new firmware for additional sensors or devices that integrate with the Zeal4 platform, please consider adding them to this module. Create a new subdirectory for your device type, include your `.ino` (or other source) files, and provide a detailed `README.md` with setup and configuration instructions.