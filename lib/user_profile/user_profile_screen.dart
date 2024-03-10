import 'dart:io';
import 'package:cricket/app_utils/loader_message_utils.dart';
import 'package:cricket/home/match_detail/table_wgt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../app_utils/app_wgts_utils.dart';
import '../app_utils/color_constants.dart';
import '../app_utils/custom_button.dart';
import '../routing_dir/app_screen_const.dart';
import 'user_profile_controller.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
      init: UserProfileController(),
      global: false,
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: controller.userProfile.isEmpty
              ? const ShowLoaderWgt()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: SvgPicture.asset(
                            'assets/down_dot.svg',
                            height: 300,
                            fit: BoxFit.cover,
                            semanticsLabel: 'Logo',
                          ),
                        ),
                        Positioned(
                          top: 70,
                          left: Get.width * 0.33,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.imgPath.isNotEmpty
                                  ? CircleAvatar(
                                      radius: 60,
                                      backgroundImage:
                                          FileImage(File(controller.imgPath)),
                                    )
                                  : CircleAvatar(
                                      radius: 70,
                                      backgroundImage: NetworkImage(
                                          controller.userProfileImg),
                                    ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Get.width * 0.1, top: 6),
                                child: Text(
                                  controller.userProfile[0].UserName,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Edit profile picture',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.dialogForImageUpload();
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.pink,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Center(
                            child: Text(
                              'User Profile',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ColorConstants().blackColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Get.width * 0.11,
                        right: Get.width * 0.11,
                        top: 32,
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 12,
                            child: Image.network(
                              helmet,
                              width: 200,
                              height: 250,
                              fit: BoxFit.cover,
                              opacity: const AlwaysStoppedAnimation(.2),
                            ),
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.updateUserProfileDetails();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: ColorConstants().greenColor,
                                      ),
                                    ),
                                    child: const Text(
                                      'Update',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              LabelTxtController(
                                label: 'Full Name',
                                isReadOnly: false,
                                textEditingController:
                                    controller.nameController,
                              ),
                              LabelTxtController(
                                label: 'Phone Number',
                                isReadOnly: true,
                                textEditingController:
                                    controller.phoneController,
                              ),
                              LabelTxtController(
                                label: 'E-mail',
                                isReadOnly: false,
                                textEditingController:
                                    controller.emailController,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      label: 'Register as player ',
                      wth: double.infinity,
                      margin:
                          const EdgeInsets.only(top: 24, left: 32, right: 32),
                      hgt: 50,
                      color: ColorConstants().greenColor,
                      onTap: () {
                        Get.toNamed(AppScreenConst.registrationFormScreen);
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
