import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BarChartWidgetView extends GetView {
  const BarChartWidgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: Center(
        child: Text(
          'BarChartWidgetView is working',
        ),
      ),
    );
  }
}
