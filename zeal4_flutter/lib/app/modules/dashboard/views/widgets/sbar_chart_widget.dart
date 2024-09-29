import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zeal4_client/zeal4_client.dart';

import '../../../../../serverpod.dart';

class SBarChartWidgetView extends StatefulWidget {
  const SBarChartWidgetView(
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
  State<SBarChartWidgetView> createState() => _SBarChartWidgetViewState();
}

class _SBarChartWidgetViewState extends State<SBarChartWidgetView> {
  List<CartesianSeries> chartSeries = [];
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
            // build chart series for each field
            for (var field in widget.fields) {
              final data = jsonDecode(update.message);
              final timestamp = DateTime.fromMillisecondsSinceEpoch(
                double.parse('${data['timestamp'] * 1000}').toInt(),
              );
              final timeStampFormat = DateFormat.Hms().format(timestamp);
              double value = double.parse('${data[field]}');

              log('datasource total items = ${datasource.length}');

              final chartSerieField =
                  chartSeries.firstWhere((p) => (p.name == field));

              chartSerieField.dataSource!
                  .add(ChartData(timeStampFormat, value));

              if (widget.points <= datasource.length) {
                chartSerieField.dataSource!.removeAt(0);
              }
            }

            // build update chartdata
            if (mounted) {
              setState(() {
                log('${DateTime.now()} - device log');
              });
            }
          }
          // get snapshot devicelog
          if (update is SnapshotDeviceLog) {
            // build init chartdata
            final devicelogs = update.devicelogs;

            // build chart series for each field
            for (var field in widget.fields) {
              datasource = [];

              for (var log in devicelogs) {
                final data = jsonDecode(log.message);
                final timestamp = DateTime.fromMillisecondsSinceEpoch(
                  double.parse('${data['timestamp'] * 1000}').toInt(),
                );
                final timeStampFormat = DateFormat.Hms().format(timestamp);
                double value = double.parse('${data[field]}');
                datasource.add(ChartData(timeStampFormat, value));
              }

              chartSeries.add(
                ColumnSeries<ChartData, dynamic>(
                  name: field,
                  dataSource: datasource.reversed.toList(),
                  xValueMapper: (datum, index) => datum.x,
                  yValueMapper: (datum, index) => datum.y,
                  animationDuration: 0,
                ),
              );

              log('datasource total items = ${datasource.length}');
            }

            setState(() {
              log('${DateTime.now()} - snapshot device log');
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
      /*
      child: StreamBuilder(
        stream: client.devicelog
            .deviceLogMessage(widget.deviceId, widget.points, true),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return buildError(snapshot);
          }

          if (snapshot.hasData) {
            final data = snapshot.data;

            List<CartesianSeries> chartSeries = [];

            if (data is SnapshotDeviceLog) {
              final devicelogs = data.devicelogs;

              for (var field in widget.fields) {
                List<ChartData> datasource = [];

                for (var log in devicelogs) {
                  final data = jsonDecode(log.message);
                  final timestamp = DateTime.fromMillisecondsSinceEpoch(
                    double.parse('${data['timestamp'] * 1000}').toInt(),
                  ).toIso8601String();
                  double value = double.parse('${data[field]}');

                  datasource.add(ChartData(timestamp, value));
                }

                chartSeries.add(
                  ColumnSeries<ChartData, dynamic>(
                    name: field,
                    dataSource: datasource.reversed.toList(),
                    xValueMapper: (datum, index) => datum.x,
                    yValueMapper: (datum, index) => datum.y,
                    animationDuration: 0,
                  ),
                );
              }
            }

            return buildChart(chartSeries);
          }

          // loading
          return buildLoading();
        },
      ),
      */
    );
  }

  SfCartesianChart buildChart(
      List<CartesianSeries<dynamic, dynamic>> chartSeries) {
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(),
      primaryYAxis: const NumericAxis(),
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
