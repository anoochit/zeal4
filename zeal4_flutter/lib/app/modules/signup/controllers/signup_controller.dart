import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import '../../../../serverpod.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  signUpWithEmailPassword(
      {required String name,
      required String email,
      required String password}) async {
    final authController = EmailAuthController(client.modules.auth);
    return await authController.createAccountRequest(name, email, password);
  }
}
