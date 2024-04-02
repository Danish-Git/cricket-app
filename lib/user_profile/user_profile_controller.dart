import 'dart:io';
import 'package:cricket/app_utils/app_static.dart';
import 'package:cricket/app_utils/loader_message_utils.dart';
import 'package:cricket/user_profile/UserProfileRepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../app_utils/shared_pref_utils.dart';

class UserProfileController extends GetxController {
  ////////

  final UserProfileRepo _userProfileRepo = UserProfileRepo();

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  late SharedPreferencesService prefs;

  @override
  void onInit() {
    super.onInit();
    getPrefInit();
  }

  void getPrefInit() async {
    nameController = TextEditingController(text: AppStatic.userName);
    phoneController =
        TextEditingController(text: '+91-${AppStatic.userNumber}}');
    emailController = TextEditingController(text: AppStatic.userEmail);

    prefs = await SharedPreferencesService.getInstance();
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
      updateUserProfile();
    }
  }

  void updateUserProfile() {
    showLoaderDialog();
    _userProfileRepo
        .updateUserProfileImg(fileName: File(imgPath))
        .then((value) {
      Get.back();
      if (value.status) {
        print(value.data);
        showTopSnackBarSuccessColor(value.message.toString());
      } else {
        showTopSnackBarError(value.message.toString());
      }
    });
  }

  ////////

  void updateUserProfileDetails() async {
    showLoaderDialog();
    _userProfileRepo
        .updateUserProfileDetails(
      email: emailController.text.trim(),
      userName: nameController.text.trim(),
    )
        .then((value) {
      Get.back();
      if (value.status) {
        showTopSnackBarSuccessColor(value.message.toString());

        AppStatic.userName = nameController.text.trim();
        AppStatic.userEmail = emailController.text.trim();
        prefs.setString('userName', nameController.text.trim());
        prefs.setString('userEmail', emailController.text.trim());
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
