import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../home/home_repo.dart';
import '../home/response/notification_response.dart';
import '../user_profile/UserProfileRepo.dart';
import '../user_profile/user_profile_response.dart';

class LiveTvScreenController extends GetxController {
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    getUserDetail();
    statYoutube();
  }

  String userName = '';
  String userImg = '';

  void getUserDetail() {
    UserProfileRepo().getUserProfile().then((value) {
      if (value.status) {
        UserProfileResponse response = UserProfileResponse.fromJson(value.data);
        userName = response.data[0].UserName;
        userImg = response.data[0].ProfilePicture;
      }
    });
  }

  List<NotificationList> notificationList = [];

  void getAllNotifications() {
    HomeRepo().getAllNotificationsApi().then((value) {
      if (value.status == true) {
        NotificationResponse notificationResponse =
            NotificationResponse.fromJson(value.data);
        notificationList.addAll(notificationResponse.data);
        isLoading = false;
        update();
      }
    });
  }

  ///////////////// youtube related

  @override
  void onReady() {
    super.onReady();
    getAllNotifications();
  }

  List<String> scoreList = ['1', 'W', '4', '6', 'Wd', '3', 'W', '2', 'Wd', '6'];

  late YoutubePlayerController youtubePlayerController;

  bool isFullScreen = false;

  void onFullScreenChange() {
    isFullScreen = !isFullScreen;
    update();
  }

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;

  final bool _isPlayerReady = false;

  void statYoutube() {
    String videoId = YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=H5d0gIyZ0CY&ab_channel=StarSports')!;
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && !youtubePlayerController.value.isFullScreen) {
      // setState(() {
      //   _playerState = _controller.value.playerState;
      //   _videoMetaData = _controller.metadata;
      // });
    }
  }
}
