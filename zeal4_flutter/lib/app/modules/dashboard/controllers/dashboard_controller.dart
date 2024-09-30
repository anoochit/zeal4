import 'dart:async';

import 'package:get/get.dart';
import 'package:zeal4_client/zeal4_client.dart';

class DashboardController extends GetxController {
  //
  Rx<Dashboard> dashboard = Dashboard(
    name: '',
    description: '',
    userInfoId: 0,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    dashboard.value = Get.arguments;
    update(['dashboard']);
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }
}
