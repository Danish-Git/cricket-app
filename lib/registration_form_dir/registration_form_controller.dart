import 'dart:io';
import 'package:cricket/app_utils/loader_message_utils.dart';
import 'package:cricket/routing_dir/app_screen_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'register_repo.dart';

class RegistrationFormController extends GetxController {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var dobController = TextEditingController();
  var addressController = TextEditingController();

  bool isCheckBoxSelected = false;

  void onCheckBoxTap() {
    isCheckBoxSelected = !isCheckBoxSelected;
    update();
  }

  String imgName = '';

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

  void onCameraClick(bool type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(
      source: type ? ImageSource.camera : ImageSource.gallery,
    );
    if (photo != null) {
      imgName = photo.path;
      update();
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(1990),
        firstDate: DateTime(1989, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      dobController = TextEditingController(
          text: '${picked.day}/${picked.month}/${picked.year}');
      update();
    }
  }

  void registerValidation() {
    if (nameController.text.trim().isEmpty) {
      showTopSnackBarError('Please enter your full name');
      return;
    } else if (phoneController.text.trim().isEmpty) {
      showTopSnackBarError('Please enter mobile number');
      return;
    } else if (emailController.text.trim().isEmpty) {
      showTopSnackBarError('Please enter your email');
      return;
    } else if (dobController.text.trim().isEmpty) {
      showTopSnackBarError('Please select your date of birth');
      return;
    } else if (addressController.text.trim().isEmpty) {
      showTopSnackBarError('Please enter your permanent address');
      return;
    } else if (imgName.isEmpty) {
      showTopSnackBarError('Please upload your aadhar card photo');
      return;
    } else if (!isCheckBoxSelected) {
      showTopSnackBarError('Please select save option');
      return;
    } else {
      showLoaderDialog();
      saveUserDetail();
    }
  }

  void saveUserDetail() {
    RegisterRepo()
        .saveUserRegistrationDetailApi(
      mNumber: phoneController.text.trim(),
      name: nameController.text.trim(),
      fName: 'fName',
      mName: 'mName',
      gender: 'Male',
      dob: dobController.text.trim(),
      email: emailController.text.trim(),
      address: addressController.text.trim(),
      userType: 'Bowler',
      imgName: File(imgName),
    )
        .then((value) {
      Get.back();
      if (value.status) {
        showTopSnackBarSuccessColor(value.message.toString());
        Get.toNamed(AppScreenConst.paymentOption);
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
    dobController.dispose();
    addressController.dispose();

    super.dispose();
  }
}
