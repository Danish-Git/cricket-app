import 'dart:io';

import 'package:cricket/app_utils/loader_message_utils.dart';
import 'package:cricket/user_profile/UserProfileRepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'user_profile_response.dart';

class UserProfileController extends GetxController {
  ////////

  final UserProfileRepo _userProfileRepo = UserProfileRepo();

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  String userProfileImg = '';

  @override
  void onInit() {
    super.onInit();
    getUserDetail();
  }

  List<UserProfileData> userProfile = [];

  void getUserDetail() {
    _userProfileRepo.getUserProfile(number: '0123456789').then((value) {
      if (value.status) {
        UserProfileResponse response = UserProfileResponse.fromJson(value.data);
        userProfile.addAll(response.data);
        nameController = TextEditingController(text: userProfile[0].UserName);
        phoneController =
            TextEditingController(text: '+91-${userProfile[0].Mobile}');
        emailController = TextEditingController(text: userProfile[0].Email);
        userProfileImg = userProfile[0].ProfilePicture;
        update();
      }
    });
  }

  /////// DIALOG FOR IMAGE UPLOAD OPTIONS
  void dialogForImageUpload() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.defaultDialog(
      title: 'Upload Expense',
      titleStyle: const TextStyle(fontSize: 20),
      content: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Text('Select options for image upload'),
      ),
      confirm: ElevatedButton(
        onPressed: () async {
          Get.back();
          onCameraClick(true);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent, side: BorderSide.none),
        child: const Text(
          'Camera',
          style: TextStyle(color: Colors.white),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () {
          Get.back();
          onCameraClick(false);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue, side: BorderSide.none),
        child: const Text(
          'File Explorer',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  String imgPath = '';

  void onCameraClick(bool type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(
      source: type ? ImageSource.camera : ImageSource.gallery,
    );
    if (photo != null) {
      imgPath = photo.path;
      update();
    }
  }

  void updateUserProfile() {
    showLoaderDialog();
    _userProfileRepo
        .updateUserProfileImg(number: '0123456789', fileName: File(imgPath))
        .then((value) {
      Get.back();
      if (value.status) {
        showTopSnackBarSuccessColor(value.message.toString());
      } else {
        showTopSnackBarError(value.message.toString());
      }
    });
  }

  ////////

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
