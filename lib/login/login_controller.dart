import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_screen.dart';

class LoginController extends GetxController {
  var phoneController = TextEditingController();
  var otpController = TextEditingController();

  String? verificationId;
  String? otpCode;

  void authPhone() async {
    if (phoneController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            print(e.toString());
          },
          codeSent: (String verificationCode, int? resendToken) {
            verificationId = verificationCode;

            Future.delayed(const Duration(seconds: 1), () {
              Get.to(
                    () => const OtpScreen(),
              );
            });
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print(verificationId.toString());
          },
          phoneNumber: "+917652829979",
        );
      } catch (e) {
        print(e.toString());
      }
    }
  }

  void onVerifyClick() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otpController.text.toString(),
      );
      FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        print(value.toString());
      });
    } catch (e) {
      print(e.toString());
    }
  }

//////////
}

