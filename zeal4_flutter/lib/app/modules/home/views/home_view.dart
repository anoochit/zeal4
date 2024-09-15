import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeal4_flutter/app/utils/grid_utils.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Obx(() {
        final dashboards = controller.dashboards;
        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: GridUtils.responsiveGridColumn(context.width),
            childAspectRatio: 3 / 2,
          ),
          itemCount: dashboards.length,
          itemBuilder: (BuildContext context, int index) {
            final dashboard = dashboards[index];
            final name = dashboard.name;
            return Card(
              elevation: 0.5,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  // TODO : open dashboard
                  Get.toNamed(
                    Routes.DASHBOARD,
                    arguments: dashboard,
                  );
                },
                child: GridTile(
                  child: Center(
                    child: Text(name),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
