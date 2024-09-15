import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zeal4_client/zeal4_client.dart';

import '../../controllers/dashboard_controller.dart';

class TextWidgetView extends GetView<DashboardController> {
  const TextWidgetView({
    super.key,
    required this.name,
    required this.description,
    required this.fields,
    required this.deviceId,
  });

  final String name;
  final String description;
  final List<String> fields;
  final int deviceId;

  List<DeviceLog> deviceLogFromJson(String str) =>
      List<DeviceLog>.from(jsonDecode(str).map((x) => DeviceLog.fromJson(x)));

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: StreamBuilder(
        stream: controller.streamDeviceLog(deviceId: deviceId, total: 1),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }

          if (snapshot.hasData) {
            final data = snapshot.data;

            if (data != null) {
              // convert to list of device log
              final logs = deviceLogFromJson(data);
              // get firt message
              final log = logs.first.message;
              // get value from first field
              final value = jsonDecode(log)[fields.first];
              return Center(
                child: Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              );
            } else {
              return const Center(
                child: Text('nodata'),
              );
            }
          }

          return Container();
        },
      ),
    );
  }
}
