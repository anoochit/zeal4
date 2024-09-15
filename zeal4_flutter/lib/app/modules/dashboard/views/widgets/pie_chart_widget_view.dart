import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PieChartWidgetView extends GetView {
  const PieChartWidgetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: Center(
        child: Text(
          'PieChartWidgetView is working',
        ),
      ),
    );
  }
}
