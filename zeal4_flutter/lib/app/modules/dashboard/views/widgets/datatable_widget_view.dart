import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DataTableWidgetView extends GetView {
  const DataTableWidgetView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 0.5,
      child: Center(
        child: Text(
          'DatatableWidgetView is working',
        ),
      ),
    );
  }
}
