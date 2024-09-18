import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zeal4_client/zeal4_client.dart';

import '../../../../../serverpod.dart';

class LineChartWidgetView extends StatefulWidget {
  const LineChartWidgetView(
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
  State<LineChartWidgetView> createState() => _LineChartWidgetViewState();
}

class _LineChartWidgetViewState extends State<LineChartWidgetView> {
  late Stream<SnapshotDeviceLog> stream;

  @override
  void initState() {
    super.initState();
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
        stream: client.devicelog
            .streamDeviceLog(widget.deviceId, widget.points, true),
        builder:
            (BuildContext context, AsyncSnapshot<SnapshotDeviceLog> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error}',
              ),
            );
          }

          if (snapshot.hasData) {
            final data = snapshot.data;

            final devicelogs = data!.devicelogs;

            List<CartesianSeries> chartSeries = [];

            for (var field in widget.fields) {
              List<ChartData> datasource = [];

              for (var log in devicelogs) {
                final data = jsonDecode(log.message);
                DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(
                  double.parse('${data['timestamp'] * 1000}').toInt(),
                  isUtc: true,
                );
                double value = double.parse('${data[field]}');
                datasource.add(ChartData(timestamp, value));
              }

              chartSeries.add(
                LineSeries<ChartData, dynamic>(
                  dataSource: datasource,
                  xValueMapper: (datum, index) => datum.x,
                  yValueMapper: (datum, index) => datum.y,
                ),
              );
            }

            return SfCartesianChart(
              primaryXAxis: const DateTimeAxis(),
              primaryYAxis: const NumericAxis(),
              series: chartSeries,
            );
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

class ChartData {
  final DateTime x;
  final double y;
  ChartData(
    this.x,
    this.y,
  );
}
