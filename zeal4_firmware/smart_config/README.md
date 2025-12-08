# Smart Config Firmware

## Overview

This directory is designated for firmware related to "Smart Config" or similar Wi-Fi provisioning methods for IoT devices, typically ESP8266 or ESP32 microcontrollers. Smart Config allows for a simplified way to connect an IoT device to a Wi-Fi network without needing to hardcode credentials or use a temporary access point.

## What is Smart Config?

Smart Config is a technology that enables IoT devices to receive Wi-Fi network credentials (SSID and password) from a mobile application. The mobile app broadcasts these credentials, which the IoT device, in a specific listening mode, can "sniff" out and use to connect to the network. This method streamlines the initial setup process for end-users, making it more user-friendly than traditional provisioning techniques.

## Purpose of this Directory

Place your Wi-Fi Smart Config enabled firmware binaries (`.bin` files) or source code (e.g., `.ino` files for Arduino IDE) within this directory. These firmwares are specifically designed to put the device into a Smart Config listening mode upon startup, allowing it to be easily provisioned with Wi-Fi credentials via a companion mobile application.

## How it Works (Typical Flow)

1.  **Device Boot-up**: The IoT device, loaded with Smart Config firmware, powers on and enters a Smart Config listening mode.
2.  **Mobile App**: The user opens a mobile application, enters their Wi-Fi SSID and password, and initiates the Smart Config process.
3.  **Broadcast**: The mobile app broadcasts the Wi-Fi credentials (often disguised or encoded) using various techniques (e.g., UDP broadcasts, changes in Wi-Fi beacon frames).
4.  **Device Reception**: The IoT device, listening passively, captures these broadcasted packets, extracts the credentials, and attempts to connect to the Wi-Fi network.
5.  **Confirmation**: Once connected, the device may send a confirmation message to the mobile app or a cloud service.

## Usage / Flashing

To use the firmware in this directory:

1.  **Select the appropriate firmware**: Choose the `.bin` or `.ino` file that corresponds to your ESP device and desired Smart Config implementation.
2.  **Flash the firmware**: Use a suitable flashing tool (e.g., esptool.py, NodeMCU PyFlasher, Arduino IDE) to upload the firmware to your ESP8266 or ESP32 board.
3.  **Power on the device**: The device should enter Smart Config mode.
4.  **Use a mobile app**: Utilize a compatible mobile application (e.g., Espressif's ESP-TOUCH app or a custom app) to provision the device with your Wi-Fi credentials.

## Example Files

-   `aqi_smart_config.ino`: An example Arduino sketch for an AQI sensor integrated with Smart Config. (Note: This file is expected to be placed here if it is part of the project).