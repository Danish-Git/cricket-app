import 'package:cricket/live_tv_dir/live_match_detail/helper/helper.dart';
import 'package:cricket/models/payer_scores.dart';
import 'package:get/get.dart';

import '../../../../../api_methods/api_methods.dart';
import '../../../../../app_utils/helper.dart';
import '../../../../../models/main_scores.dart';
import '../../../../../models/match.dart';
import '../../../../../repositories/fb_match.dart';
import '../../../../../repositories/match.dart';

class LiveTabController extends GetxController {

  final MatchModel? match;

  List<String> overList = ['1', 'W', '4', '6', 'Wd', '3', 'W', '2', 'Wd', '6'];

  bool isLoading = false;
  bool shouldLoadMoreBatsmanData = true;
  bool isBatsmanDataLoading = false;
  bool shouldLoadMoreBowlersData = true;
  bool isBowlersDataLoading = false;
  bool? isLiveMatch = false;

  num totalRuns = 0;
  num totalBalls = 0;
  String overs = '0';

  List<MainScoresModel> scoreList = [];
  List<PayerScores> batsmanList = [];
  List<PayerScores> bowlersList = [];

  FirebaseMatchRepository? firebaseMatchRepository;

  LiveTabController({this.match, this.isLiveMatch});

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  Future<void> initData () async {
    if(isLiveMatch ?? false) {
      firebaseMatchRepository = FirebaseMatchRepository();
      getDataForLiveMatch();
    } else {
      getDataForOldMatch();
    }
  }

  Future<void> getDataForLiveMatch() async {
    toggleIsBatsmanDataLoading();
    toggleIsBowlersDataLoading();
    firebaseMatchRepository?.getBatsmanData(matchId: match?.matchID, onDataChange: onLiveBatsmanDataChange);
    firebaseMatchRepository?.getBowlersData(matchId: match?.matchID, onDataChange: onLiveBowlerDataChange);
  }

  Future<void> getDataForOldMatch() async {
    scoreList.clear();
    toggleLoading();
    await getMatchScores(match?.team1ID);
    await getMatchScores(match?.team2ID);
    toggleLoading();
  }

  Future<void> getMatchScores(String? team1id) async {
    try {
      Map<String, dynamic> params = {
        'TeamID': team1id,
        'TournamentID': match?.tournamentsID,
      };

      ApiResponse response = await MatchRepository().getMatchScores(params);
      if(response.status) {
        scoreList.add(response.data);
      } else {
        Helper.showToast(response.message ?? '');
      }
    } catch (e) {
      Helper.showToast(e.toString());
      rethrow;
    }
  }

  void toggleLoading() {
    isLoading = !isLoading;
    update();
  }


  void onLiveBatsmanDataChange(List<PayerScores> playerList) {

    scoreList = LiveMatchHelper.getMatchSores(playerList, match);

    batsmanList = playerList;
    totalRuns = totalBalls = 0;
    for (var element in batsmanList) {
      totalRuns += num.tryParse(element.r?.toString() ?? '0') ?? 0;
      totalBalls += num.tryParse(element.b?.toString() ?? '0') ?? 0;
    }
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