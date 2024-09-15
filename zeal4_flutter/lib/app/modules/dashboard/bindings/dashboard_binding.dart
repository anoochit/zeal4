import 'package:get/get.dart';
import 'package:zeal4_flutter/app/modules/dashboard/views/widgets/text_widget_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<TextWidgetController>(
      () => TextWidgetController(),
    );
  }
}
