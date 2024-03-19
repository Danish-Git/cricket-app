import 'package:cricket/app_utils/helper.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeAgo;

import '../../home_repo.dart';
import '../../response/notification_response.dart';

class NotificationBottomSheetController extends GetxController {

  List<NotificationList>? notificationList;

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    getAllNotifications();
  }

  void getAllNotifications() {
    toggleIsLoading();
    HomeRepo().getAllNotificationsApi().then((value) {
      if (value.status == true) {
        notificationList = [];
        NotificationResponse notificationResponse = NotificationResponse.fromJson(value.data);
        notificationList?.addAll(notificationResponse.data);
      } else {
        Helper.showToast(value.message ?? '');
      }
    }).whenComplete(() => toggleIsLoading())
        .onError((error, stackTrace) => null);
  }


  String timeAgoFunction(String data) {
    return timeAgo.format(DateTime.parse(data), locale: 'en_short');
  }

  void toggleIsLoading() {
    isLoading = !isLoading;
    update();
  }

}