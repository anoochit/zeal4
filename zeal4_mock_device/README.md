# Zeal4 Mock Device

This directory contains a Node.js application designed to simulate an IoT device. Its primary purpose is to generate and publish mock sensor and system data to an MQTT broker, facilitating testing and development of the `zeal4_etl` service and the broader Zeal4 IoT platform without requiring physical hardware.

## Overview

The mock device leverages `node-os-utils` to simulate system metrics (CPU and memory usage) and publishes this data as JSON payloads to a specified MQTT topic. This allows developers to quickly test data ingestion, processing, and visualization workflows.

## Features

- **System Metric Simulation**: Generates realistic-looking CPU and memory usage data.
- **MQTT Publishing**: Sends simulated data to an MQTT broker on a predefined topic.
- **Configurable Interval**: Publishes data every 10 seconds.
- **Logging**: Utilizes `winston` for logging device activity and errors.
- **Integration Testing**: Provides a consistent data stream for testing the `zeal4_etl` service's data processing capabilities.

## Prerequisites

Before running the mock device, ensure you have the following installed:

- [Node.js](https://nodejs.org/) (LTS version recommended)
- [npm](https://www.npmjs.com/) (Node Package Manager, usually bundled with Node.js)

## Installation

1. Navigate to the `zeal4_mock_device` directory:

    ```bash
    cd zeal4_mock_device
    ```

2. Install the necessary Node.js dependencies:

    ```bash
    npm install
    ```

## Usage

To start the mock device and begin publishing simulated data:

1. Ensure your MQTT broker (e.g., Mosquitto, typically started via `zeal4_server/docker-compose.yaml`) is running and accessible at `localhost:1883`.
2. From the `zeal4_mock_device` directory, run the application:

    ```bash
    node index.js
    ```

    You will see console output indicating MQTT connection status and the messages being published. Detailed logs will also be written to the `log/` subdirectory.

## Simulated Data

The mock device publishes data to the `/device/mock_device/msg` topic.

**MQTT Topic:**
`/device/mock_device/msg` (where `mock_device` is the `deviceId` configured in `index.js`)

**Example Payload (JSON):**
The payload represents CPU and memory usage, along with a Unix timestamp.

```json
 {
  "cpu_usage": 1.54,
  "mem_usage": 12387.91,
  "mem_total": 15741.32,
  "timestamp": 1726031393
 }
```

- **`cpu_usage`**: Simulated CPU utilization percentage.
- **`mem_usage`**: Simulated used memory in MB.
- **`mem_total`**: Total system memory in MB.
- **`timestamp`**: Unix epoch time in seconds when the data was generated.

This payload format is specifically designed to be consumed and processed by the `zeal4_etl` service, which extracts the various sensor data points and timestamps for storage in the Serverpod backend.

## Logging

The mock device uses `winston` for logging:

- `log/error_pub.log`: Stores error messages.
- `log/combined_pub.log`: Stores all informational and error messages.
