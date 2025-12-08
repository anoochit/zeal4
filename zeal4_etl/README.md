# Zeal4 ETL Service

This directory contains the Extract, Transform, Load (ETL) service for the Zeal4 IoT project. It is a Dart command-line application responsible for acting as a bridge between MQTT-enabled IoT devices and the Serverpod backend. The service subscribes to various MQTT topics, processes incoming sensor data, and then pushes this structured data to the Serverpod API for storage and further visualization.

## Overview

The `zeal4_etl` service is a crucial component of the Zeal4 ecosystem, ensuring that raw data from IoT devices is collected, transformed into a usable format, and reliably loaded into the central database. It is designed to be resilient, with built-in connection checks for both the MQTT broker and the Serverpod backend.

## Features

- **MQTT Integration**: Connects to an MQTT broker, subscribes to specified topics, and listens for incoming sensor data messages.
- **Robust Data Parsing**:
  - Parses JSON payloads from various device types (e.g., custom Zeal devices, Tasmota-flashed devices).
  - Extracts device IDs, sensor names, and their respective data points.
- **Data Transformation**:
  - Adds or normalizes timestamps (Unix epoch seconds) to sensor data for consistent time-series analysis.
  - Combines device IDs with sensor names to create unique identifiers for each sensor's data stream.
- **Serverpod Integration**: Uses the `zeal4_client` library to interact with the Serverpod backend, persisting the processed sensor data.
- **Connection Health Checks**: Performs a proactive check of the Serverpod backend connection before initiating MQTT subscriptions, ensuring the data has a destination.
- **Automatic Reconnection**: Automatically attempts to reconnect to the MQTT broker if the connection is lost.

## Supported MQTT Topics and Data Processing

The ETL service currently subscribes to the following MQTT topics:

- **`/device/+/msg`**: For custom Zeal-like devices.
  - Expects a JSON payload where each top-level key (excluding special fields like `Time`) represents a sensor, and its value is a map of sensor readings.
  - Example: `{"sensor_temp": {"value": 25.5}, "sensor_humid": {"value": 60.2}}`
  - Automatically adds a `timestamp` field (Unix epoch) to each sensor's data if not already present.
- **`tele/+/SENSOR`**: For Tasmota-flashed devices (e.g., PMS5003, DHT22).
  - Expects a JSON payload containing a `"Time"` field and one or more sensor data objects (e.g., `"PMS5003"`, `"DHT22"`).
  - Extracts the relevant sensor's data.
  - Converts the `"Time"` field from ISO 8601 string to a Unix epoch timestamp and adds it to the sensor's data under the `"timestamp"` key.
  - Example: `{"Time":"2025-12-08T05:24:26","PMS5003":{"CF1":13,...}}`

## Prerequisites

- [Dart SDK](https://dart.dev/get-dart)
- A running [MQTT Broker](https://mqtt.org/software/) (e.g., Mosquitto, typically provided by `zeal4_server/docker-compose.yaml`)
- A running [Serverpod Backend](https://serverpod.dev/) (the `zeal4_server` application)

## Installation

1. Navigate to the `zeal4_etl` directory:

    ```bash
    cd zeal4_etl
    ```

2. Install the Dart project dependencies:

    ```bash
    dart pub get
    ```

## Configuration

The ETL service uses constants for its primary connection settings, defined in `lib/zeal4_etl.dart`:

- `mqttHost`: The hostname or IP address of your MQTT broker (default: `localhost`).
- `serverPodHost`: The URL of your Serverpod backend (default: `http://localhost:8080/`).

Modify these values in `lib/zeal4_etl.dart` if your MQTT broker or Serverpod instance is not running on the default `localhost` addresses.

## Usage

To run the ETL service:

1. Ensure your MQTT broker and Serverpod backend are running.
2. From the `zeal4_etl` directory:

    ```bash
    dart bin/main.dart
    ```

    The service will start, attempt to connect to Serverpod and MQTT, and then continuously listen for incoming messages.
    Console output will provide information on connection status, incoming topics/payloads, and processed data.

## Integration with Zeal4 Project

The `zeal4_etl` service works in conjunction with:

- **`zeal4_firmware/`**: Firmware for IoT devices publishes raw sensor data to the MQTT broker, which this ETL service consumes.
- **`zeal4_server/`**: The Serverpod backend, where all processed data is stored via the `zeal4_client` library.
- **`zeal4_mock_device/`**: A simulated device that can publish test data to the MQTT broker, which is then processed by this ETL service.
