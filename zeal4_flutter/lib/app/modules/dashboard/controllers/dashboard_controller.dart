import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:zeal4_client/zeal4_client.dart';

class DashboardController extends GetxController {
  //
  Rx<Dashboard> dashboard = Dashboard(name: '', description: '').obs;
  Rx<DateTime> dateTime = DateTime.now().obs;

  late StreamSubscription subscribe;

  @override
  void onInit() {
    super.onInit();
    dashboard.value = Get.arguments;

    subscribe = Stream.periodic(const Duration(seconds: 5)).listen((v) {
      log('update');
      dateTime.value = DateTime.now();
      update(['dashboard']);
    });
  }

  @override
  Future<void> onClose() async {
    await subscribe.cancel();
    super.onClose();
  }
}
