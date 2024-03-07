import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoaderDialog() {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            child: const CircularProgressIndicator(
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}

class ShowLoaderWgt extends StatelessWidget {
  const ShowLoaderWgt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.indigo),
    );
  }
}

void showTopSnackBarSuccessColor(String title) {
  Get.snackbar(
    '',
    '',
    padding: const EdgeInsets.only(bottom: 24),
    duration: const Duration(seconds: 2),
    animationDuration: const Duration(milliseconds: 700),
    messageText: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: -0.02,
      ),
    ),
    snackPosition: SnackPosition.TOP,
    borderRadius: 16,
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    isDismissible: true,
    dismissDirection: DismissDirection.vertical,
    forwardAnimationCurve: Curves.easeInOut,
    backgroundColor: const Color.fromRGBO(67, 4, 108, 1),
    backgroundGradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [
          0.2,
          0.4,
          0.6,
          0.8,
          1,
        ],
        colors: [
          Color.fromRGBO(86, 1, 142, 1),
          Color.fromRGBO(76, 3, 125, 1),
          Color.fromRGBO(67, 4, 108, 1),
          Color.fromRGBO(60, 6, 96, 1),
          Color.fromRGBO(48, 10, 74, 1),
        ]),
  );
}

void showTopSnackBarError(String title) {
  Get.snackbar(
    '',
    '',
    padding: const EdgeInsets.only(bottom: 24),
    messageText: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 15,
        letterSpacing: -0.02,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 2),
    backgroundColor: const Color.fromRGBO(232, 65, 24, 1),
    borderRadius: 16,
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    colorText: Colors.white,
    isDismissible: true,
    dismissDirection: DismissDirection.vertical,
    forwardAnimationCurve: Curves.easeInOut,
  );
}
