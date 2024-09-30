import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:validation_pro/validate.dart';

import '../../../routes/app_pages.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = controller.formKey;
    final emailController = controller.emailController;
    final passwordController = controller.passwordController;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SizedBox(
          width: 360,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // email
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.alternate_email),
                    hintText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!Validate.isEmail(value!)) {
                      return 'Enter email address';
                    }
                    return null;
                  },
                ),

                const Gap(16.0),

                // password
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password_outlined),
                    hintText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (!Validate.isPassword(value!)) {
                      return 'Min 6 and Max 12 characters.\nAt least one uppercase character.\nAt least one number.\nAt least one special character [@#\$!%?]';
                    }
                    return null;
                  },
                ),

                const Gap(16.0),

                // signin button
                FilledButton(
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      // signins
                      final result = await controller.signInWithEmailPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      // check signed in result
                      if (result != null) {
                        log('signed in as = ${result.email}');
                        Get.offAllNamed(Routes.HOME);
                      } else {
                        Get.snackbar(
                          'Error',
                          'Cannot sign in, please change your email or password',
                        );
                      }
                    }
                  },
                  child: const Text('Sign In'),
                ),

                const Gap(8.0),
                TextButton(
                  onPressed: () => Get.offAllNamed(Routes.SIGNUP),
                  child: const Text("Don't have an account? Sign Up"),
                ),
                const Gap(16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
