import 'package:cricket/app_utils/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routing_dir/app_screen_const.dart';

class LoginController extends GetxController {
  var phoneController = TextEditingController();
  var otpController = TextEditingController();

  String? verificationId;
  String? otpCode;

  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  String? phoneNumber;

  bool? isOTPScreen;
  bool isSendingOTP = false;
  bool isVerifyingOTP = false;

  @override
  void onInit() {
    phoneNumber = Get.arguments?["phoneNo"];
    isOTPScreen = Get.arguments?["isOTPScreen"] ?? false;
    if((isOTPScreen ?? false) && phoneNumber != null) verifyPhoneNumber();
    super.onInit();
  }

  void getPhoneNo(String? newValue) {
    phoneNumber = newValue;
    update();
  }

  void validateAndSendOTP() {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState!.save();
      if(phoneNumber?.isNotEmpty ?? false) {
        navigateToOTPScreen();
      }
    }
  }

  void navigateToOTPScreen() => Get.toNamed(AppScreenConst.otpScreen, arguments: {
    "phoneNo" : phoneNumber, "isOTPScreen" : true});

  void verifyPhoneNumber() async {
    toggleIsSendingOTP();
    if (phoneNumber?.isNotEmpty ?? false) {
      try {
        await auth.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            Helper.showToast(e.toString());
            print(e.toString());
          },
          codeSent: (String verificationCode, int? resendToken) {
            verificationId = verificationCode;
            update();
            Helper.showToast("OTP sent");
            print('---->$verificationId');
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            this.verificationId = verificationId;
            update();
            print('---->$verificationId');
          },
          phoneNumber: '+91$phoneNumber',
        );
      } catch (e) {
        print(e.toString());
      } finally {
        toggleIsSendingOTP();
      }
    }
  }

  void onVerifyClick() async {
    try {
      toggleIsVerifyingOTP();
        final AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: otpController.text.toString(),);
        final User? user = (await auth.signInWithCredential(credential)).user;
        final User? currentUser = auth.currentUser;
        assert(user?.uid == currentUser?.uid);
        if (user != null) {

          /// #important
          /// Save phoneNumber, user.uid in shared preferences

          Helper.showToast("Sign in successfully");
          Get.toNamed(AppScreenConst.bottomNav);
        } else {
          Helper.showToast("Sign in failed");
        }
    } catch (e) {
      print(e.toString());
    } finally {
      toggleIsVerifyingOTP();
    }
  }

//////////

  String? validatePhoneNo(String? value) {
    if(value?.isEmpty ?? true) {
      return 'Please provide phone number';
    } else if((value?.length ?? 0) < 10 && !(num.tryParse(value ?? 'null')?.isFinite ?? false)) {
      return 'Please provide valid phone number';
    } else {
      return null;
    }
  }

  void toggleIsSendingOTP() {
    isSendingOTP = !isSendingOTP;
    update();
  }

  void toggleIsVerifyingOTP() {
    isVerifyingOTP = !isVerifyingOTP;
    update();
  }
}

