import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import '../../../../serverpod.dart';

class SigninController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<UserInfo?> signInWithEmailPassword(
      {required email, required password}) async {
    final authController = EmailAuthController(client.modules.auth);

    // signin
    final result = await authController.signIn(email, password);
    if (result != null) {
      return result;
    } else {
      return null;
    }
  }
}
