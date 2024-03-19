import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_utils/color_constants.dart';
import '../app_utils/custom_button.dart';
import '../app_utils/image_utils.dart';
import '../routing_dir/app_screen_const.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      global: false,
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
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
                  height: 290,
                  child: const SvgImgUtils(
                    imgName: 'assets/signIn.svg',
                    wth: 300,
                    hgt: 290,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12, top: 12, bottom: 8),
                  child: Text(
                    'Login to Cricket Club',
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
                    'We are happy to see you here',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(63, 62, 62, 1),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 12, top: 18, bottom: 6),
                  child: Text(
                    'Phone',
                    style: TextStyle(
                      fontSize: 14.4,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
                Container(
                  height: 52,
                  width: Get.width * 0.8,
                  margin: const EdgeInsets.only(left: 12),
                  padding: EdgeInsets.only(bottom: 4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorConstants().greenColor,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.phone_android,
                        size: 24,
                        color: ColorConstants().greenColor,
                      ),
                      Center(
                        child: Form(
                          key: controller.formKey,
                          child: SizedBox(
                            width: Get.width * 0.6,
                            child: TextFormField(
                              maxLength: 10,
                              onSaved: controller.getPhoneNo,
                              validator: controller.validatePhoneNo,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(bottom: 6),
                                  hintText: '9876543210',
                                  counterText: '',
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(78, 78, 78, 1),
                                    fontSize: 14.4,
                                    fontWeight: FontWeight.w400,
                                  )),
                              cursorColor: ColorConstants().greenColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomButton(
                    label: 'Continue',
                    wth: double.infinity,
                    margin: const EdgeInsets.only(top: 28, left: 22, right: 22),
                    hgt: 50,
                    color: ColorConstants().greenColor,
                    onTap: () => controller.validateAndSendOTP()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
