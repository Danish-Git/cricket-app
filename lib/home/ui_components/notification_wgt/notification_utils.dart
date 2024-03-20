import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';

class NotificationUtils {
  void onNotificationTap() {
    Get.bottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        side: BorderSide(width: 1, color: Colors.transparent),
      ),
      const NotificationBottomSheet()
    );
  }
}


