import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BarChartWidgetView extends GetView {
  const BarChartWidgetView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 0.5,
      child: Center(
        child: Text(
          'BarChartWidgetView is working',
        ),
      ),
    );
  }
}
