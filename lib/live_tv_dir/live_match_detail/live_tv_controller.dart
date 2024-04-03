import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class LiveTvScreenController extends GetxController {

  late YoutubePlayerController videoPlayerController;

  bool isPlayerReady = false;

  @override
  void onInit() {
    super.onInit();
    statYoutube();
  }

  ///////////////// youtube related
  void statYoutube() {

    videoPlayerController = YoutubePlayerController.fromVideoId(
      videoId: 'H5d0gIyZ0CY',
      autoPlay: true,
      params: const YoutubePlayerParams(
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );

    isPlayerReady = true;
    update();
  }
}
