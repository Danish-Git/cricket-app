import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/ui_components/notification_wgt/notification_utils.dart';

PreferredSizeWidget? defaultAppBar({
  required String titleText,
  required String userImg,
  bool isBackButtonEnable = false,
}) {

  Widget getProfileWidget () {
    return CircleAvatar(
      radius: 20,
      backgroundImage: NetworkImage(userImg),
    );
  }

  Widget getLeadingWidget () {
    if(userImg.isEmpty) {
      return const SizedBox.shrink();
    } else if (isBackButtonEnable) {
      return IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 25,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
        child: getProfileWidget(),
      );
    }
  }

  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if(isBackButtonEnable) Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 8, 5),
          child: getProfileWidget(),
        ),
        Text(
          titleText,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(0, 116, 56, 1),
          ),
        ),
      ],
    ),
    centerTitle: userImg.isEmpty,

    leading: getLeadingWidget(),
    actions: [
      IconButton(
        onPressed: () => NotificationUtils().onNotificationTap(),
        icon: const Icon(
          Icons.notifications_outlined,
          color: Colors.black,
          size: 32,
        ),
      )
    ],
  );
}

