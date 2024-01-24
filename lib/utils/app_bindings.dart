import 'package:hfa/controllers/authentication_controller.dart';

import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<NotificationsController>(NotificationsController());
    Get.put<AuthenticationController>(AuthenticationController());
  }
}
