import 'package:cricket/app_utils/color_constants.dart';
import 'package:cricket/app_utils/custom_button.dart';
import 'package:cricket/routing_dir/app_screen_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentDoneScreen extends StatelessWidget {
  const PaymentDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: SvgPicture.asset(
                    'assets/down_dot.svg',
                    height: 400,
                    fit: BoxFit.cover,
                    semanticsLabel: 'Logo',
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Your payment is\nconfirmed!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(232, 31, 66, 1),
                        ),
                      ),
                      const SizedBox(height: 52),
                      SizedBox(
                        width: Get.width * 0.7,
                        height: 150,
                        child: SvgPicture.asset(
                          'assets/payment_done.svg',
                          fit: BoxFit.cover,
                          semanticsLabel: 'Logo',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            CustomButton(
              label: 'Go to home',
              wth: double.maxFinite,
              hgt: 50,
              color: ColorConstants().greenColor,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              onTap: () {
                Get.offAllNamed(AppScreenConst.home);
              },
            )
          ],
        ),
      ),
    );
  }
}
