import 'package:cricket/payment_dir/payment_done_controller.dart';
import 'package:get/get.dart';


class PaymentDoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentDoneController());
  }
}
