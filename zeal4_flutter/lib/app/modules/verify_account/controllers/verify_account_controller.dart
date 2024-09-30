import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_client/module.dart';

import '../../../../serverpod.dart';

class VerifyAccountController extends GetxController {
  final verificationCodeController = TextEditingController();

  Future<UserInfo?> signInWithEmailPassword(
      {required String email, required String password}) async {
    final authController = EmailAuthController(client.modules.auth);

    // signin
    final result = await authController.signIn(email, password);
    if (result != null) {
      return result;
    } else {
      return null;
    }
  }

  verifyAccount({required String email, required verificationCode}) async {
    final authController = EmailAuthController(client.modules.auth);
    final userInfo =
        await authController.validateAccount(email, verificationCode);
    return userInfo;
  }

  Future<UserInfo?> updateToUserScope() async {
    return await client.user.updateToUserScope();
  }
}
