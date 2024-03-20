import 'package:cricket/app_utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'list_item.dart';

class NotificationBottomSheet extends StatelessWidget {
  const NotificationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationBottomSheetController>(
      init: NotificationBottomSheetController(),
      global: false,
      builder: (controller) {
        return Container(
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
              controller.isLoading
                ? Expanded(child: Center(child: Helper.showLoader())) 
                : (controller.notificationList?.isEmpty ?? true)
                  ? Expanded(child: Center(child: Helper.showError('No notification available')))
                  : Expanded(
                    child: Column(
                      children: [
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
                            itemCount: controller.notificationList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return NotificationListItem(
                                index: index,
                                notificationTitle: controller.notificationList![index].Notification,
                                dateTime: controller.timeAgoFunction(controller.notificationList![index].NotificationDT),
                              );
                            },
                          ),
                        ),
                    ],
                ),
                  )
              ],
            ),
          );
      });
  }
}
