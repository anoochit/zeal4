import 'dart:developer';

import 'package:get/get.dart';
import 'package:zeal4_client/zeal4_client.dart';

import 'package:zeal4_flutter/serverpod.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  RxList<Dashboard> dashboards = <Dashboard>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDashboard();
  }

  // get all dashboard
  getDashboard() async {
    dashboards.value =
        await client.dashboard.getDashboards(sessionManager.signedInUser!.id!);
    log('found ${dashboards.length} items');
  }

  signOut() {
    sessionManager.signOut().then((v) => Get.offAllNamed(Routes.SIGNIN));
  }
}
