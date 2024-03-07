import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_utils/color_constants.dart';
import '../app_utils/custom_button.dart';
import '../app_utils/image_utils.dart';
import '../routing_dir/app_screen_const.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height * 0.23),
          SizedBox(
            width: Get.width * 0.85,
            height: 310,
            child: const SvgImgUtils(
              imgName: "assets/cricket.svg",
              wth: 300,
              hgt: 310,
            ),
          ),
          SizedBox(height: Get.height * 0.13),
          const Text(
            "Welcome to our app",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(33, 33, 33, 1),
            ),
          ),
          CustomButton(
            label: "Proceed to Login",
            wth: double.infinity,
            margin: const EdgeInsets.only(top: 20, left: 24, right: 24),
            hgt: 55,
            color: ColorConstants().greenColor,
            onTap: () {
              Get.toNamed(AppScreenConst.login);
            },
          ),
        ],
      ),
    );
  }
}
