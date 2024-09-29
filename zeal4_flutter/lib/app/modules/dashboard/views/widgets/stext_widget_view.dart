import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:zeal4_client/zeal4_client.dart';

import '../../../../../serverpod.dart';

class STextWidgetView extends StatefulWidget {
  const STextWidgetView({
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

  @override
  State<STextWidgetView> createState() => _STextWidgetViewState();
}

class _STextWidgetViewState extends State<STextWidgetView> {
  // device log
  DeviceLog? deviceLog;

  // snapshot device log
  // SnapshotDeviceLog? snapshotDeviceLog;

  @override
  void initState() {
    super.initState();
    // listen streaming data
    listenToUpdate();
  }

  Future<void> listenToUpdate() async {
    while (true) {
      try {
        //
        final messageUpdates = client.devicelog.deviceLogMessage(
          widget.deviceId,
          widget.points,
          true,
        );

        await for (final update in messageUpdates) {
          if (update is DeviceLog) {
            // get device log
            if (mounted) {
              setState(() {
                log('device log', time: DateTime.now());
                deviceLog = update;
              });
            }
          }

          if (update is SnapshotDeviceLog) {
            //get snapshot devicelog
            setState(() {
              log('snapshot device log', time: DateTime.now());
              deviceLog = update.devicelogs.first;
            });
          }
        }
      } on MethodStreamException catch (e) {
        log('$e');
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      clipBehavior: Clip.antiAlias,
      child: Builder(
        builder: (context) {
          if (deviceLog != null) {
            // title
            final title = widget.name;

            // unit from first field
            final unit = widget.units.first;

            // value
            final value = jsonDecode(deviceLog!.message)[widget.fields.first];

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
                  unit,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            );
          }

          return const Center(
            child: Text('loading...'),
          );
        },
      ),
    );
  }
}
