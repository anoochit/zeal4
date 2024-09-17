import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:zeal4_client/zeal4_client.dart';

import '../../../../../serverpod.dart';

class TextWidget3View extends StatefulWidget {
  const TextWidget3View({
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
  State<TextWidget3View> createState() => _TextWidget3ViewState();
}

class _TextWidget3ViewState extends State<TextWidget3View> {
  late Stream<SnapshotDeviceLog> stream;

  @override
  void initState() {
    super.initState();

    stream = client.devicelog.streamDeviceLog(widget.deviceId, 1, true);
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
        stream: stream,
        builder:
            (BuildContext context, AsyncSnapshot<SnapshotDeviceLog> snapshot) {
          // has error
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            log('stream done');
          }

          // has data
          if (snapshot.hasData) {
            final data = snapshot.data;

            if (data != null) {
              // get firt message
              final log = data.devicelogs.first.message;

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
