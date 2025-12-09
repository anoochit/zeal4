# Zeal4 IoT Project

## Overview

Zeal4 is an IoT project designed to collect, process, and visualize sensor data from various devices. It leverages Serverpod for robust backend services, Flutter for a cross-platform client application, and MQTT for efficient device communication.

## Project Structure

The project is organized into several key modules:

- **`zeal4_client/`**: Contains the generated client-side code for interacting with the Serverpod backend. This module is used by the Flutter application and the ETL process.
- **`zeal4_etl/`**: The Extract, Transform, Load (ETL) service responsible for:
  - Connecting to an MQTT broker.
  - Subscribing to device data topics (e.g., `tele/+/SENSOR`, `/device/+/msg`).
  - Parsing incoming MQTT messages, extracting sensor data, and normalizing timestamps.
  - Logging processed device data to the Serverpod backend.
- **`zeal4_firmware/`**: A placeholder directory for device firmware code (e.g., for ESP32, Arduino).
- **`zeal4_flutter/`**: The cross-platform Flutter application that serves as the user interface for monitoring devices, viewing dashboards, and visualizing sensor data.
- **`zeal4_server/`**: The Serverpod backend that provides the API, handles data storage (PostgreSQL), and manages other server-side logic. It includes Docker Compose configurations for essential services like PostgreSQL, Redis, Adminer, Minio, and Mosquitto.
- **`zeal4_mock_device/`**: A Node.js application that simulates an IoT device, publishing data to the MQTT broker for testing and development purposes.
- **`screenshots/`**: Contains various screenshots of the application and its schema.

## Features

- **Real-time Data Ingestion**: Collects sensor data from IoT devices via MQTT.
- **Data Processing (ETL)**: Extracts, transforms, and loads sensor data, enriching it with timestamps and combining device and sensor identifiers.
- **Backend Services**: Powered by Serverpod, offering a robust and scalable API for data management.
- **Cross-platform UI**: A Flutter application for web, mobile, and desktop to visualize device data.
- **Dockerized Environment**: Easy setup and deployment using Docker Compose for backend services.
- **Timezone Configuration**: All backend services are configured to use the `Asia/Bangkok` timezone.

## Setup and Installation

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/)
- [Serverpod CLI](https://docs.serverpod.dev/#install-serverpod) (if performing Serverpod-specific tasks like code generation or migrations)
- Node.js and npm (for `zeal4_mock_device`)

### Getting Started

1. **Clone the repository**:

    ```bash
    git clone https://github.com/anoochit/zeal4.git
    cd zeal4
    ```

2. **Start the Backend Services**:
    Navigate to the `zeal4_server` directory and start the Docker Compose services:

    ```bash
    cd zeal4_server
    docker-compose up -d
    ```

    This will start PostgreSQL, Redis, Adminer, Minio, and Mosquitto.

3. **Run Serverpod Migrations (if necessary)**:
    Ensure your Serverpod database is up-to-date with any migrations:

    ```bash
    cd zeal4_server
    serverpod generate # (if you change protocol files)
    dart bin/main.dart --apply-migrations # (to apply migrations)
    ```

4. **Run the Serverpod Server**:
    From the `zeal4_server` directory:

    ```bash
    dart bin/main.dart
    ```

5. **Run the ETL Process**:
    From the `zeal4_etl` directory:

    ```bash
    dart bin/main.dart
    ```

6. **Run the Mock Device (Optional for testing)**:
    From the `zeal4_mock_device` directory:

    ```bash
    npm install
    node index.js
    ```

7. **Run the Flutter Client Application**:
    From the `zeal4_flutter` directory:

    ```bash
    flutter run
    ```

## Screenshots

| ![](/screenshots/screenshot01.png) | ![](/screenshots/screenshot02.png) | ![](/screenshots/screenshot03.png) |
| ---------------------------------- | ---------------------------------- | ---------------------------------- |
| ![](/screenshots/screenshot06.png) | ![](/screenshots/screenshot04.png) | ![](/screenshots/screenshot05.png) |

## Contributing

Contributions are welcome! Please follow the standard GitHub flow: fork the repository, create a branch, make your changes, and submit a pull request.

## License

This project is licensed under the [LICENSE](LICENSE) file.
