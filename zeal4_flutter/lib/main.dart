import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/windows_utils.dart';
import 'serverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init serverpod
  await initServerPodClient();

  // run app
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    ),
  );

  // windows config
  initWindows();
}
