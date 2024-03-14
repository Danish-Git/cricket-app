import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: controller.phoneController,
                        readOnly: false,
                        maxLength: 13,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 4),
                          counterText: '',
                          label: Text('Phone Number'),
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(150, 150, 150, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(150, 150, 150, 1),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(150, 150, 150, 1),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(150, 150, 150, 1),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // LabelTxtController(
                    //   label: 'Phone Number',
                    //   textEditingController: controller.phoneController,
                    // ),
                    LabelTxtController(
                      label: 'E-mail',
                      textEditingController: controller.emailController,
                    ),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: controller.dobController,
                        readOnly: true,
                        maxLength: 40,
                        style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 4),
                          counterText: '',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.selectDate(context);
                            },
                            child: const Icon(Icons.calendar_month),
                          ),
                          label: const Text('Date of Birth'),
                          labelStyle: const TextStyle(
                            color: Color.fromRGBO(150, 150, 150, 1),
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(150, 150, 150, 1),
                            ),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(150, 150, 150, 1),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(150, 150, 150, 1),
                            ),
                          ),
                        ),
                      ),
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
                        controller.registerValidation();
                        // Get.toNamed(AppScreenConst.paymentOption);
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
