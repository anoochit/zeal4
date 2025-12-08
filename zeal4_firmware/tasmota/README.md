# Tasmota AQI with MQTT Integration

This module provides instructions and configuration details for setting up an AQI (Air Quality Index) sensor (specifically the PMS5003) with Tasmota firmware on an ESP8266/ESP32 device, and integrating it with an MQTT broker. This setup allows the device to publish air quality data, which can then be consumed by the `zeal4_etl` service.

## Features

-   **AQI Sensor Integration**: Uses the PMS5003 sensor for precise air quality measurements (PM1.0, PM2.5, PM10).
-   **Tasmota Firmware**: Leverages the versatile Tasmota firmware for easy configuration and management.
-   **MQTT Communication**: Publishes sensor data to a configurable MQTT topic, enabling seamless integration with the IoT ecosystem.
-   **Automated Data Publishing**: Configures Tasmota to periodically send sensor readings.

## Hardware Requirements

-   ESP8266 or ESP32 development board (e.g., NodeMCU, Wemos D1 Mini)
-   PMS5003 Air Quality Sensor
-   Jumper wires for connecting the sensor to the ESP board

## Software Requirements

-   Tasmota firmware (flashed onto your ESP device)
-   A web browser for Tasmota's web interface

## Configuration Steps

Follow these steps to configure your Tasmota device for PMS5003 AQI sensing and MQTT publishing.

### 1. Flash Tasmota Firmware

Ensure your ESP device is flashed with a recent version of Tasmota firmware that supports the PMS5003 sensor. Refer to the official [Tasmota documentation](https://tasmota.github.io/docs/) for flashing instructions if needed.

### 2. Wiring the PMS5003 Sensor

Connect the PMS5003 sensor to your ESP device. The PMS5003 typically uses a UART interface.

-   **PMS5003 TX** to **ESP RX** (e.g., ESP GPIO3 / RXD0)
-   **PMS5003 RX** to **ESP TX** (e.g., ESP GPIO1 / TXD0)
-   **PMS5003 VCC** to **ESP 5V**
-   **PMS5003 GND** to **ESP GND**

_Note: Specific GPIOs may vary based on your ESP board and Tasmota build. Always verify pin assignments._

### 3. Tasmota Module and GPIO Configuration

Access your Tasmota device's web interface.

1.  **Go to `Configuration` -> `Configure Module`**:
    -   Select a module that matches your ESP board (e.g., `Generic (0)` if not specific).
    -   Save and restart.

2.  **Go to `Configuration` -> `Configure Module` -> `Configure GPIO`**:
    -   Identify the GPIO pins connected to your PMS5003 sensor.
    -   Assign the correct `Sensor` type to the RX pin (e.g., `PMS5003 RX` or `PMSX003 RX`).
    -   Assign the correct `Sensor` type to the TX pin (e.g., `PMS5003 TX` or `PMSX003 TX`).

    The following screenshot shows an example configuration:
    ![GPIO26 for PMS5003 RX](/zeal4_firmware/tasmota/tasmota-aqi02.png)
    _(Example: GPIO26 configured for PMS5003 RX)_

3.  **Save** your GPIO configuration and the device will restart. After restarting, you should see sensor readings on the Tasmota main page.

    ![AQI (PMS5003)](/zeal4_firmware/tasmota/tasmota-aqi01.png)
    _(Example: Tasmota Web UI showing PMS5003 readings)_

### 4. MQTT Configuration

To send data to your MQTT broker (e.g., the Mosquitto instance running in `zeal4_server`):

1.  **Go to `Configuration` -> `Configure MQTT`**:
    -   **Host**: Enter the IP address or hostname of your MQTT broker (e.g., `localhost` or the IP of your Docker host if Mosquitto is running there).
    -   **Port**: `1883` (default MQTT port).
    -   **Client**: A unique client ID (e.g., `tasmota_E3ECEC`).
    -   **User**: (If your MQTT broker requires authentication)
    -   **Password**: (If your MQTT broker requires authentication)
    -   **Topic**: `tele/%topic%/SENSOR` (This is the default Tasmota teleperiod topic and will be replaced by your client ID, e.g., `tele/tasmota_E3ECEC/SENSOR`).
    -   **Full Topic**: `tele/%hostname%/SENSOR` or `tele/%topic%/SENSOR` - Tasmota uses these placeholders to generate the actual topic. `%topic%` defaults to `%hostname%`.

    The following screenshot shows an example MQTT configuration:
    ![Tasmota Configuration](/zeal4_firmware/tasmota/tasmota-aqi03.png)
    _(Example: Tasmota MQTT Configuration)_

2.  **Save** your MQTT configuration. Tasmota will attempt to connect to the broker and start publishing data.

### 5. Verify Data Publishing

You can verify that data is being published by:
-   Using an MQTT client (like MQTT Explorer) to subscribe to the `tele/#` topic on your broker.
-   Checking the logs of the `zeal4_etl` service, which should show incoming messages and processed data.

## MQTT Topic and Payload Format

Tasmota, by default, publishes sensor data to a topic like `tele/<DeviceName>/SENSOR` (where `<DeviceName>` is configured in Tasmota).

**Example Topic:**
`tele/tasmota_E3ECEC/SENSOR`

**Example Payload (JSON):**
```json
{
  "Time": "2025-12-08T05:24:26",
  "PMS5003": {
    "CF1": 13,
    "CF2.5": 15,
    "CF10": 15,
    "PM1": 13,
    "PM2.5": 15,
    "PM10": 15,
    "PB0.3": 0,
    "PB0.5": 0,
    "PB1": 0,
    "PB2.5": 0,
    "PB5": 0,
    "PB10": 0
  }
}
```
The `zeal4_etl` service is designed to parse this payload, extract the `PMS5003` (or other sensor) data, add a Unix timestamp, and log it to the Serverpod backend.