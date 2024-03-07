import 'package:get/get.dart';

import 'registration_form_controller.dart';

class RegistrationFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationFormController());
  }
}
