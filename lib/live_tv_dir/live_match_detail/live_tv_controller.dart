import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../api_methods/api_methods.dart';
import '../../app_utils/constants/navigation_params.dart';
import '../../app_utils/helper.dart';
import '../../models/main_scores.dart';
import '../../models/match.dart';
import '../../repositories/match.dart';

class LiveTvScreenController extends GetxController {

  late YoutubePlayerController videoPlayerController;

  MatchModel? match = Get.arguments?[NavParamsConstants.liveMatch];
  bool? isLive = Get.arguments?[NavParamsConstants.isLive];

  bool isPlayerReady = false;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  Future<void> initData () async {
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
