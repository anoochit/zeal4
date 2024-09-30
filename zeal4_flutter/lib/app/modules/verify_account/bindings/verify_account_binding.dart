import 'package:get/get.dart';

import '../controllers/verify_account_controller.dart';

class VerifyAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyAccountController>(
      () => VerifyAccountController(),
    );
  }
}
