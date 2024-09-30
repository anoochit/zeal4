import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:validation_pro/validate.dart';

import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = controller.formKey;
    final nameController = controller.nameController;
    final emailController = controller.emailController;
    final passwordController = controller.passwordController;

    return SizedBox(
      width: 360,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // name
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_circle_outlined),
                hintText: 'Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter name';
                }
                return null;
              },
            ),

            const Gap(16.0),
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
                if (formKey.currentState!.validate()) {
                  /*
                  // signins
                  final result = await controller.signUpWithEmailPassword(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  if (result) {
                    Get.offAllNamed(
                      Routes.VERIFY_ACCOUNT,
                      parameters: {
                        'email': emailController.text,
                        'password': passwordController.text
                      },
                    );
                  } else {
                    Get.snackbar(
                      'Error',
                      'Cannot sign up, please change your email or password',
                    );
                  }
                  */
                }
              },
              child: const Text('Sign Up'),
            ),

            const Gap(8.0),

            TextButton(
              onPressed: () => Get.offAllNamed(Routes.SIGNIN),
              child: const Text('Already have an account? Sign In'),
            ),
            const Gap(16.0),
          ],
        ),
      ),
    );
  }
}
