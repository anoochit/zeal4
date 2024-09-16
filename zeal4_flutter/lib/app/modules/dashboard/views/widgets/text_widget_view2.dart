import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:zeal4_client/zeal4_client.dart';

import '../../../../../serverpod.dart';

class TextWidget2View extends StatefulWidget {
  const TextWidget2View({
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
  State<TextWidget2View> createState() => _TextWidget2ViewState();
}

class _TextWidget2ViewState extends State<TextWidget2View> {
  List<DeviceLog> deviceLogFromJson(String str) =>
      List<DeviceLog>.from(jsonDecode(str).map((x) => DeviceLog.fromJson(x)));

  String json = '[]';

  late Stream stream;

  @override
  void initState() {
    super.initState();

    stream = client.devicelog.getDeivceLog(widget.deviceId, 1, true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: StreamBuilder(
        stream: stream.distinct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }

          if (snapshot.hasData) {
            final data = snapshot.data;
            // log('${DateTime.timestamp()} : $data');

            if (data != null) {
              // convert to list of device log
              final logs = deviceLogFromJson(data);

              // get firt message
              final log = logs.first.message;
              // title
              final title = widget.name;
              // get value from first field
              final value = jsonDecode(log)[widget.fields.first];
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
