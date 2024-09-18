import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zeal4_client/zeal4_client.dart';

import '../../../utils/grid_utils.dart';
import '../controllers/dashboard_controller.dart';
import 'widgets/bar_chart_widget_view.dart';
import 'widgets/datatable_widget_view.dart';
import 'widgets/pie_chart_widget_view.dart';
import 'widgets/text_widget_view3.dart';
import 'widgets/wrong_widget_view.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    final widgets = controller.dashboard.value.widget ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.dashboard.value.name)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: List.generate(widgets.length, (index) {
            final widget = widgets[index];
            final deviceId = widget.deviceId;
            final name = widget.name;
            final description = widget.description;
            final fields = widget.fields;
            final units = widget.units;
            const points = 600;
            return SizedBox(
              width: GridUtils.responsiveSize(context.width, widget.width),
              height: (widget.type == WidgetType.table)
                  ? null
                  : GridUtils.responsiveSize(context.width, widget.height),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Builder(
                  builder: (context) {
                    switch (widget.type) {
                      case WidgetType.text:
                        return TextWidget3View(
                          name: name,
                          description: description,
                          fields: fields,
                          units: units,
                          deviceId: deviceId,
                          points: 1,
                        );

                      case WidgetType.bar:
                        return const BarChartWidgetView();

                      case WidgetType.pie:
                        return const PieChartWidgetView();

                      case WidgetType.table:
                        return DataTableWidgetView(
                          name: name,
                          description: description,
                          fields: fields,
                          units: units,
                          deviceId: deviceId,
                          points: 10,
                        );

                      default:
                        return const WrongWidgetView();
                    }
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
