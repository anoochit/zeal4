import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zeal4_client/zeal4_client.dart';

import '../../../../../serverpod.dart';

class BarChartWidgetView extends StatefulWidget {
  const BarChartWidgetView(
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
  State<BarChartWidgetView> createState() => _BarChartWidgetViewState();
}

class _BarChartWidgetViewState extends State<BarChartWidgetView> {
  late Stream<SnapshotDeviceLog> stream;

  @override
  void initState() {
    super.initState();
    // get stream device logs
    stream =
        client.devicelog.streamDeviceLog(widget.deviceId, widget.points, true);
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
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
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
                StackedColumnSeries<ChartData, dynamic>(
                  dataSource: datasource,
                  xValueMapper: (datum, index) => datum.x,
                  yValueMapper: (datum, index) => datum.y,
                ),
              );
            }

            return SfCartesianChart(
              primaryXAxis: const DateTimeAxis(),
              series: chartSeries,
            );
          }

          return Container();
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
