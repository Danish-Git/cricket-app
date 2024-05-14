import 'package:get/get.dart';

import '../../../../models/match.dart';

class LiveScreenBodyController extends GetxController {
  bool isLoading = false;
  bool isPlayerReady = false;
  bool isLiveMatch = false;

  final MatchModel? match;

  LiveScreenBodyController({required this.isPlayerReady, this.match});

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() {
    isLiveMatch = match?.matchStatus == 'Running';
  }


}