import 'dart:developer';

import 'package:get/get.dart';
import 'package:zeal4_client/zeal4_client.dart';
import 'package:zeal4_flutter/serverpod.dart';

class DashboardController extends GetxController {
  //
  Rx<Dashboard> dashboard = Dashboard(name: '', description: '').obs;

  @override
  void onInit() {
    super.onInit();
    dashboard.value = Get.arguments;
    log(dashboard.value.name);
  }

  Stream<String> streamDeviceLog({required int deviceId, required int total}) {
    final snapshot = client.devicelog.getDeivceLog(deviceId, total, true);

    return snapshot;
  }
}
