import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
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
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // timer periodic
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        log('update bar chart widget');
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
    // get stream device logs

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
              child: Text(
                '${snapshot.error}',
              ),
            );
          }

          if (snapshot.hasData) {
            final devicelogs = snapshot.data;
            List<CartesianSeries> chartSeries = [];

            for (var field in widget.fields) {
              List<ChartData> datasource = [];

              for (var log in devicelogs!) {
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
            }

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
  final String x;
  final double y;
  ChartData(
    this.x,
    this.y,
  );
}
