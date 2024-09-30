import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:zeal4_client/zeal4_client.dart';

import '../../../../../serverpod.dart';

class DataTableWidgetView extends StatefulWidget {
  const DataTableWidgetView(
      {super.key,
      required this.name,
      required this.description,
      required this.fields,
      required this.units,
      required this.deviceId,
      required this.points});

  final String name;
  final String description;
  final List<String> fields;
  final List<String> units;
  final int deviceId;
  final int points;

  @override
  State<DataTableWidgetView> createState() => _DataTableWidgetViewState();
}

class _DataTableWidgetViewState extends State<DataTableWidgetView> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // timer periodic
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
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
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 64.0),
                child: Text(
                  '${snapshot.error}',
                ),
              ),
            );
          }

          if (snapshot.hasData) {
            final devicelogs = snapshot.data;

            return DataTable(
              columns: List.generate(
                widget.fields.length,
                (index) => DataColumn(
                  label: Text(widget.fields[index]),
                ),
              ),
              rows: devicelogs!.map((e) {
                final message = e.message;
                final data = jsonDecode(message) as Map<String, dynamic>;
                return DataRow(
                  cells: widget.fields
                      .map(
                        (cell) => DataCell(
                          (cell == 'timestamp')
                              ? Text(DateTime.fromMillisecondsSinceEpoch(
                                  double.parse('${data[cell] * 1000}').toInt(),
                                ).toIso8601String())
                              : Text('${data[cell]}'),
                        ),
                      )
                      .toList(),
                );
              }).toList(),
            );
          }
          // loading
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 64.0),
              child: Text('loading...'),
            ),
          );
        },
      ),
    );
  }
}
