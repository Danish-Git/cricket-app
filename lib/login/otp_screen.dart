import 'package:cricket/app_utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../app_utils/color_constants.dart';
import '../app_utils/custom_button.dart';
import '../app_utils/image_utils.dart';
import 'login_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      global: false,
      init: LoginController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstants().greenColor,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.85,
                  height: 300,
                  child: const SvgImgUtils(
                    imgName: 'assets/auth_confirm.svg',
                    wth: 300,
                    hgt: 300,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12, top: 12, bottom: 4),
                  child: Text(
                    'Enter authentication code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    'Enter the 6-digit code we just texted to\nyour phone number',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(63, 62, 62, 1),
                    ),
                  ),
                ),
                controller.isSendingOTP ? Helper.showLoader()
                  : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12, top: 28, bottom: 6),
                      child: Text(
                        'Verification Code',
                        style: TextStyle(
                          fontSize: 14.4,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(12),
                      child: PinFieldAutoFill(
                        controller: controller.otpController,
                        cursor: Cursor(
                          width: 1.7,
                          height: 16,
                          color: Colors.black,
                          radius: const Radius.circular(1),
                          enabled: true,
                        ),
                        codeLength: 6,
                        decoration: BoxLooseDecoration(
                          gapSpace: 8,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          strokeColorBuilder: const FixedColorBuilder(Colors.black),
                        ),
                        onCodeSubmitted: (code) {},
                        onCodeChanged: (val) {},
                      ),
                    ),
                    controller.isVerifyingOTP ? Helper.showLoader()
                      : CustomButton(
                      label: 'Continue',
                      wth: double.infinity,
                      margin: const EdgeInsets.only(
                          top: 28, left: 22, right: 22, bottom: 32),
                      hgt: 50,
                      color: ColorConstants().greenColor,
                      onTap: controller.onVerifyClick,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Resend Code',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants().greenColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
