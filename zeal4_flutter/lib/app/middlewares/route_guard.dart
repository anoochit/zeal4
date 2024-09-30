import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../serverpod.dart';
import '../routes/app_pages.dart';

class RouteGuard extends GetMiddleware {
  // redirect
  @override
  RouteSettings? redirect(String? route) {
    final isAuthenticated = sessionManager.isSignedIn;
    if (isAuthenticated) {
      return null;
    } else {
      return const RouteSettings(name: Routes.SIGNIN);
    }
  }
}
