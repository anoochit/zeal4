import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/verify_account_controller.dart';

class VerifyAccountView extends GetView<VerifyAccountController> {
  const VerifyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    String? email = Get.parameters['email'];
    String? password = Get.parameters['password'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify account'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: (email == null)
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FilledButton(
                    onPressed: () => Get.offAllNamed(Routes.SIGNUP),
                    child: const Text('Back'),
                  ),
                ],
              ),
            )
          : Center(
              child: SizedBox(
                width: 360.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // code
                    TextFormField(
                      controller: controller.verificationCodeController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: 'Verification Code',
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),

                    const Gap(16.0),

                    // button
                    FilledButton(
                      onPressed: () async {
                        /*
                      // verify
                      final verifyResult = await controller.verifyAccount(
                        email: email!,
                        verificationCode: _verificationCodeController.text,
                      );
            
                      // if pass
                      if (verifyResult != null) {
                        // signin and update user scope
                        final user = await controller.signInWithEmailPassword(
                          email: email!,
                          password: password!,
                        );
                        // check user result update user scope
                        if (user != null) {
                          // update scope
                          await controller.updateToCustomerScope();
                          // create customer data
                          await client.customer.createCustomerData();
                          Get.snackbar('Info', 'Verified account!');
                          Get.offAllNamed(Routes.HOME);
                        } else {
                          Get.snackbar(
                              'Error', 'Cannot signin and update account!');
                          Get.offAllNamed(Routes.SIGNUP);
                        }
                      } else {
                        Get.snackbar('Error', 'Cannot verify account!');
                        Get.offAllNamed(Routes.SIGNUP);
                      }
            
                      */
                      },
                      child: const Text('Verify Account'),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
