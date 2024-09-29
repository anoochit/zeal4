import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:zeal4_client/zeal4_client.dart';

import '../../../../../serverpod.dart';

class TextWidgetView extends StatefulWidget {
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

  @override
  State<TextWidgetView> createState() => _TextWidgetViewState();
}

class _TextWidgetViewState extends State<TextWidgetView> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // timer periodic
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        log('update text widget');
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      clipBehavior: Clip.antiAlias,
      child: FutureBuilder(
        future:
            client.devicelog.getDeviceLog(widget.deviceId, widget.points, true),
        builder:
            (BuildContext context, AsyncSnapshot<List<DeviceLog>> snapshot) {
          // has error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
              ),
            );
          }

          // has data
          if (snapshot.hasData) {
            final data = snapshot.data;

            if (data != null) {
              // get firt message
              final log = data.first;

              // title
              final title = widget.name;

              // get value from first field
              final value = jsonDecode(log.message)[widget.fields.first];

              // unit from first field
              final unit = widget.units.first;

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
            } else {
              return const Center(
                child: Text('nodata'),
              );
            }
          }

          // loading
          return const Center(
            child: Text('loading...'),
          );
        },
      ),
    );
  }
}
