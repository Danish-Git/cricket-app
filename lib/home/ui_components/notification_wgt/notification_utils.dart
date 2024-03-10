import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeAgo;

import '../../response/notification_response.dart';

/////
String timeAgoFunction(String data) {
  return timeAgo.format(DateTime.parse(data), locale: 'en_short');
}

///////

class NotificationUtils {
  void onNotificationTap(List<NotificationList> notificationList) {
    Get.bottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        side: BorderSide(width: 1, color: Colors.transparent),
      ),
      Container(
        height: Get.height * 0.8,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
        child: Column(
          children: [
            Container(
              height: 5,
              width: 40,
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(60, 60, 67, 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notificationList.length,
                itemBuilder: (BuildContext context, int index) {
                  return NotificationItem(
                    index: index,
                    notificationTitle: notificationList[index].Notification,
                    dateTime:
                        timeAgoFunction(notificationList[index].NotificationDT),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String notificationTitle;
  final int index;
  final String dateTime;

  const NotificationItem({
    super.key,
    required this.notificationTitle,
    required this.index,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.03)),
        ),
      ),
      child: ListTile(
        tileColor: const Color.fromRGBO(0, 0, 0, 0.03),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: Container(
          height: 48,
          width: 48,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(226, 232, 240, 1),
            shape: BoxShape.circle,
          ),
          child: const Text(
            'AB',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(115, 131, 155, 1),
            ),
          ),
        ),
        title: Text(
          notificationTitle,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(51, 65, 85, 1),
          ),
        ),
        trailing: Text(
          dateTime,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(71, 85, 105, 1),
          ),
        ),
      ),
    );
  }
}
