import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_utils/custom_button.dart';
import '../app_utils/image_utils.dart';
import '../app_utils/color_constants.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorConstants().greenColor,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.15),
            SizedBox(
              width: Get.width * 0.85,
              height: 300,
              child: const SvgImgUtils(
                imgName: 'assets/register_confirm.svg',
                wth: 300,
                hgt: 300,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 12, top: Get.height * 0.1, bottom: 4),
              child: const Text(
                'You’re verified!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
            CustomButton(
              label: 'Continue',
              wth: double.infinity,
              margin: const EdgeInsets.only(
                  top: 28, left: 22, right: 22, bottom: 32),
              hgt: 50,
              color: ColorConstants().greenColor,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
