import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zeal4_client/zeal4_client.dart';

import '../../../../../serverpod.dart';

class TextWidgetView extends GetView<TextWidgetController> {
  const TextWidgetView({
    super.key,
    required this.name,
    required this.description,
    required this.fields,
    required this.deviceId,
    required this.units,
    required this.points,
  });

  final String name;
  final String description;
  final List<String> fields;
  final List<String> units;
  final int deviceId;
  final int points;

  List<DeviceLog> deviceLogFromJson(String str) =>
      List<DeviceLog>.from(jsonDecode(str).map((x) => DeviceLog.fromJson(x)));

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: StreamBuilder(
        stream: controller.streamDeviceLog(deviceId: deviceId, total: points),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }

          if (snapshot.hasData) {
            final data = snapshot.data;
            log('${DateTime.timestamp()} : $data');

            if (data != null) {
              // convert to list of device log
              final logs = deviceLogFromJson(data);

              // get firt message
              final log = logs.first.message;
              // title
              final title = name;
              // get value from first field
              final value = jsonDecode(log)[fields.first];
              // unit from first field
              final unit = units.first;
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // title
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),

                  // value
                  Text(
                    '$value',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),

                  // unit
                  Text(
                    unit ?? '',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('nodata'),
              );
            }
          }

          return const Center(
            child: Text('loading...'),
          );
        },
      ),
    );
  }
}

// FIXME : should handle stream life cycle
class TextWidgetController extends GetxController {
  Stream<String> streamDeviceLog({required int deviceId, required int total}) {
    try {
      final snapshot = client.devicelog.getDeivceLog(deviceId, total, true);
      return snapshot;
    } catch (e) {
      throw ('$e');
    }
  }
}
