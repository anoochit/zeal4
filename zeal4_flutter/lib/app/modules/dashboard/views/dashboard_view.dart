import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zeal4_client/zeal4_client.dart';

import '../../../utils/grid_utils.dart';
import '../controllers/dashboard_controller.dart';
import 'widgets/bar_chart_widget_view.dart';
import 'widgets/datatable_widget_view.dart';
import 'widgets/pie_chart_widget_view.dart';
import 'widgets/text_widget_view.dart';

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
            final deviceId = widget.deviceId;
            final name = widget.name;
            final description = widget.description;
            final fields = widget.fields;
            return SizedBox(
              width: GridUtils.responsiveSize(context.width, widget.width),
              height: GridUtils.responsiveSize(context.width, widget.height),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Builder(
                  builder: (context) {
                    switch (widget.type) {
                      case WidgetType.text:
                        return TextWidgetView(
                          name: name,
                          description: description,
                          fields: fields,
                          deviceId: deviceId,
                        );

                      case WidgetType.bar:
                        return BarChartWidgetView();

                      case WidgetType.pie:
                        return PieChartWidgetView();

                      case WidgetType.table:
                        return DataTableWidgetView();

                      default:
                        return Center(
                          child: Text('no widget'),
                        );
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
