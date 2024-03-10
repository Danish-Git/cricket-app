import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_utils/app_wgts_utils.dart';
import '../app_utils/custom_button.dart';
import '../app_utils/image_utils.dart';
import '../app_utils/color_constants.dart';
import '../routing_dir/app_screen_const.dart';
import 'registration_form_controller.dart';

class RegistrationFormScreen extends StatelessWidget {
  const RegistrationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationFormController>(
      init: RegistrationFormController(),
      global: false,
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(label: 'Registration', isGreen: true),
              const SizedBox(height: 32),
              const Text(
                '  Registered your details here',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              const SizedBox(height: 4),
              const Text.rich(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                TextSpan(
                  children: [
                    TextSpan(text: '    Enter your '),
                    TextSpan(
                      text: 'Details',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: ' below'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 46, top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelTxtController(
                      label: 'Full Name',
                      textEditingController: controller.nameController,
                    ),
                    LabelTxtController(
                      label: 'Phone Number',
                      textEditingController: controller.phoneController,
                    ),
                    LabelTxtController(
                      label: 'E-mail',
                      textEditingController: controller.emailController,
                    ),
                    LabelTxtController(
                      label: 'Date of Birth',
                      textEditingController: controller.dobController,
                    ),
                    LabelTxtController(
                      label: 'Permanent Address',
                      textEditingController: controller.addressController,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 10),
                      child: Text(
                        'Upload Your Adhaar Card',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      height: 180,
                      child: GestureDetector(
                        onTap: () {
                          controller.dialogForImageUpload();
                        },
                        child: controller.imgName.isEmpty
                            ? const SvgImgUtils(
                                imgName: 'assets/upload_container.svg',
                                wth: 280,
                                hgt: 180,
                              )
                            : Image.file(
                                File(controller.imgName),
                                width: 280,
                                height: 180,
                              ),
                      ),
                    ),
                    // const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: ColorConstants().greenColor,
                          value: controller.isCheckBoxSelected,
                          fillColor:
                              MaterialStateProperty.resolveWith((Set states) {
                            return ColorConstants().greenColor;
                          }),
                          onChanged: (value) {
                            controller.onCheckBoxTap();
                          },
                        ),
                        const Text(
                          'Save your above information',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        )
                      ],
                    ),
                    CustomButton(
                      label: 'Continue',
                      wth: double.infinity,
                      margin: const EdgeInsets.only(top: 16),
                      hgt: 50,
                      color: ColorConstants().greenColor,
                      onTap: () {
                        // controller.registerValidation();
                        Get.toNamed(AppScreenConst.paymentOption);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
