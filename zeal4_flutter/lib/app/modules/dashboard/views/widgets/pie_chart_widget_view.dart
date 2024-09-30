import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:zeal4_client/zeal4_client.dart';

import '../../../../../serverpod.dart';

class PieChartWidgetView extends StatefulWidget {
  const PieChartWidgetView(
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
  State<PieChartWidgetView> createState() => _PieChartWidgetViewState();
}

class _PieChartWidgetViewState extends State<PieChartWidgetView> {
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
              child: Text(
                '${snapshot.error}',
              ),
            );
          }

          if (snapshot.hasData) {
            final devicelogs = snapshot.data!.first;
            final message = jsonDecode(devicelogs.message);
            List<ChartData> dataSource = [];
            for (var field in widget.fields) {
              dataSource.add(
                ChartData(
                  field,
                  double.parse('${message[field]}'),
                ),
              );
            }

            List<PieSeries> chartSeries = <PieSeries>[
              PieSeries(
                dataSource: dataSource,
                xValueMapper: (data, _) => data.x,
                yValueMapper: (data, _) => data.y,
                animationDelay: 0,
              )
            ];

            return SfCircularChart(
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
