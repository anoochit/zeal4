import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zeal4_client/zeal4_client.dart';

import '../../../../../serverpod.dart';

class SPieChartWidgetView extends StatefulWidget {
  const SPieChartWidgetView(
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
  State<SPieChartWidgetView> createState() => _SPieChartWidgetViewState();
}

class _SPieChartWidgetViewState extends State<SPieChartWidgetView> {
  List<PieSeries> chartSeries = [];
  List<ChartData> datasource = [];

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
          // get device log
          if (update is DeviceLog) {
            datasource = [];
            // build chart series for each field
            for (var field in widget.fields) {
              final data = jsonDecode(update.message);
              double value = double.parse('${data[field]}');
              datasource.add(
                ChartData(field, value),
              );
            }

            // build update chartdata
            if (mounted) {
              setState(() {
                log('${DateTime.now()} - spie device log');
              });
            }
          }
          // get snapshot devicelog
          if (update is SnapshotDeviceLog) {
            // build init chartdata
            final devicelog = update.devicelogs.first;
            final message = jsonDecode(devicelog.message);

            // build chart series for each field
            datasource = [];
            for (var field in widget.fields) {
              datasource.add(
                ChartData(
                  field,
                  double.parse('${message[field]}'),
                ),
              );
            }

            chartSeries = <PieSeries>[
              PieSeries(
                dataSource: datasource,
                xValueMapper: (data, _) => data.x,
                yValueMapper: (data, _) => data.y,
                animationDelay: 0,
              )
            ];

            setState(() {
              log('${DateTime.now()} - snapshot spie device log');
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
    // get stream device logs
    return Card(
      elevation: 0.5,
      clipBehavior: Clip.antiAlias,
      child: buildChart(chartSeries),
    );
  }

  SfCircularChart buildChart(List<PieSeries<dynamic, dynamic>> chartSeries) {
    return SfCircularChart(
      series: chartSeries,
      legend: const Legend(
        isVisible: true,
        position: LegendPosition.top,
      ),
    );
  }

  Center buildError(AsyncSnapshot snapshot) {
    return Center(
      child: Text(
        '${snapshot.error}',
      ),
    );
  }

  Center buildLoading() {
    return const Center(
      child: Text('loading...'),
    );
  }
}

class ChartData {
  final String x;
  final double y;
  ChartData(
    this.x,
    this.y,
  );
}
