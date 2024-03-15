import 'dart:async';
import 'package:get/get.dart';
import '../app_utils/shared_pref_utils.dart';
import '../routing_dir/app_screen_const.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkPreference();
  }

  void checkPreference() async {
    SharedPreferencesService prefs =
        await SharedPreferencesService.getInstance();

    var userNumber = prefs.getString('userNumber');

    Future.delayed(const Duration(seconds: 1), () {
      if (userNumber.isNotEmpty) {
        Get.offAllNamed(AppScreenConst.bottomNav);
      } else {
        Get.offAllNamed(AppScreenConst.welcome);
      }
    });
  }
}
