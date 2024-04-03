import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'live_tv_controller.dart';
import 'widgets/main_body/live_screen_body.dart';

class LiveTvScreen extends StatelessWidget {
  const LiveTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveTvScreenController>(
      global: false,
      init: LiveTvScreenController(),
      builder: (controller) => SafeArea(
        child: YoutubePlayerScaffold(
          controller: controller.videoPlayerController,
          aspectRatio: Get.height / Get.width,
          builder: (context, player) {
            return LiveScreenBody(player: player, isPlayerReady: controller.isPlayerReady);
          },
        ),
      )
    );
  }
}
