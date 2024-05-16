import 'package:cricket/live_tv_dir/live_match_detail/helper/helper.dart';
import 'package:get/get.dart';

import '../../../../../models/main_scores.dart';
import '../../../../../models/match.dart';
import '../../../../../models/match_overs.dart';
import '../../../../../models/payer_scores.dart';
import '../../../../../repositories/fb_match.dart';

class LiveScoreboardTabController extends GetxController {

  FirebaseMatchRepository? firebaseMatchRepository;
  final MatchModel? match;

  bool isLoading = false;
  bool shouldLoadMoreBatsmanData = true;
  bool isBatsmanDataLoading = false;
  bool shouldLoadMoreBowlersData = true;
  bool isBowlersDataLoading = false;
  bool? isLiveMatch = false;

  List<MainScoresModel>? scoreList;
  // List<String> scoreList = ['1', 'W', '4', '6', 'Wd', '3', 'W', '2', 'Wd', '6'];

  List<PayerScores> batsmanList = [];
  List<PayerScores> bowlersList = [];

  num totalRuns = 0;
  num totalBalls = 0;
  String runRate = '0';
  MatchOvers? overs;

  LiveScoreboardTabController({this.match, this.isLiveMatch});

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  Future<void> initData () async {
    if(isLiveMatch ?? false) {
      firebaseMatchRepository = FirebaseMatchRepository();
      getDataForLiveMatch();
    }
  }

  Future<void> getDataForLiveMatch() async {
    toggleIsBatsmanDataLoading();
    toggleIsBowlersDataLoading();
    firebaseMatchRepository?.getBatsmanData(matchId: match?.matchID, onDataChange: onLiveBatsmanDataChange);
    firebaseMatchRepository?.getBowlersData(matchId: match?.matchID, onDataChange: onLiveBowlerDataChange);
  }

  void onLiveBatsmanDataChange(List<PayerScores> playerList) {
    scoreList = LiveMatchHelper.getMatchSores(playerList, match);
    batsmanList = playerList;
    totalRuns = totalBalls = 0;
    for (var element in batsmanList) {
      totalRuns += num.tryParse(element.r?.toString() ?? '0') ?? 0;
      totalBalls += num.tryParse(element.b?.toString() ?? '0') ?? 0;
    }
    runRate = (totalRuns / totalBalls).toStringAsFixed(1);
    overs = LiveMatchHelper.convertToOvers(totalBalls);

    if(shouldLoadMoreBatsmanData) {
      shouldLoadMoreBatsmanData = !shouldLoadMoreBatsmanData;
      toggleIsBatsmanDataLoading();
    }
    update();
  }

  void onLiveBowlerDataChange(List<PayerScores> playerList) {
    bowlersList = playerList;
    if(shouldLoadMoreBowlersData) {
      shouldLoadMoreBowlersData = !shouldLoadMoreBowlersData;
      toggleIsBowlersDataLoading();
    }
    update();
  }

  void toggleIsBatsmanDataLoading() {
    isBatsmanDataLoading = !isBatsmanDataLoading;
    update();
  }

  void toggleIsBowlersDataLoading() {
    isBowlersDataLoading = !isBowlersDataLoading;
    update();
  }

  void disposeStream() async {
    await firebaseMatchRepository?.onDispose();
  }

}