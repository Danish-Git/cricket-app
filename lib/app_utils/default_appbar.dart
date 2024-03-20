import 'package:flutter/material.dart';

import '../home/ui_components/notification_wgt/notification_utils.dart';

PreferredSizeWidget? defaultAppBar({required String titleText, required String userImg,}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      titleText,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(0, 116, 56, 1),
      ),
    ),
    centerTitle: userImg.isEmpty,
    leading: userImg.isEmpty ? const SizedBox.shrink()
      : CircleAvatar(
      radius: 26,
      backgroundImage: NetworkImage(
        userImg,
      ),
    ),
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
