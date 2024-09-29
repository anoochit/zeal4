import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/grid_utils.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          (Platform.isWindows || Platform.isLinux || Platform.isMacOS)
              ? IconButton(
                  onPressed: () => controller.getDashboard(),
                  icon: Icon(Icons.refresh))
              : SizedBox()
        ],
      ),
      body: Obx(() {
        final dashboards = controller.dashboards;
        return RefreshIndicator(
          onRefresh: () async {
            // refresh dashboard data
            controller.getDashboard();
          },
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: GridUtils.responsiveGridColumn(context.width),
              childAspectRatio: 4 / 3,
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
                    // open dashboard screen
                    Get.toNamed(
                      Routes.DASHBOARD,
                      arguments: dashboard,
                    );
                  },
                  child: GridTile(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.monitor_outlined,
                            size: 64.0,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          Text(name),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
