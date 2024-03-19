import 'package:flutter/material.dart';

class NotificationListItem extends StatelessWidget {
  final String notificationTitle;
  final int index;
  final String dateTime;

  const NotificationListItem({
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