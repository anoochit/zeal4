import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zeal4_flutter/app/utils/grid_utils.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    final widgets = controller.dashboard.value.widget ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.dashboard.value.name)),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: List.generate(widgets.length, (index) {
            final widget = widgets[index];
            return SizedBox(
              width: GridUtils.responsiveSize(context.width, widget.width),
              height: GridUtils.responsiveSize(context.width, widget.height),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  child: Center(
                    child: Text(widget.type.name),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
