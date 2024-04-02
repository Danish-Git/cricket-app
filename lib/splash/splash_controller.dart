import 'dart:async';
import 'package:cricket/app_utils/app_static.dart';
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

    Future.delayed(const Duration(milliseconds: 700), () {
      if (userNumber.isNotEmpty) {
        AppStatic.userNumber = userNumber;
        AppStatic.userName = prefs.getString('userName');
        AppStatic.userProfileImage = prefs.getString('userProfileImage');
        AppStatic.userEmail = prefs.getString('userEmail');
        Future.delayed(const Duration(milliseconds: 300), () {
          Get.offAllNamed(AppScreenConst.bottomNav);
        });
      } else {
        Get.offAllNamed(AppScreenConst.welcome);
      }
    });
  }
}
