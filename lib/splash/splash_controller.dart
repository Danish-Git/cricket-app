import 'dart:async';
import 'package:get/get.dart';
import '../routing_dir/app_screen_const.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed(AppScreenConst.welcome);
    });
  }
}
