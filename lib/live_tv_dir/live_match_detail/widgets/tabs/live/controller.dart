import 'package:get/get.dart';

import '../../../../../api_methods/api_methods.dart';
import '../../../../../app_utils/helper.dart';
import '../../../../../models/main_scores.dart';
import '../../../../../models/match.dart';
import '../../../../../repositories/match.dart';

class LiveTabController extends GetxController {

  final MatchModel? match;

  List<String> overList = ['1', 'W', '4', '6', 'Wd', '3', 'W', '2', 'Wd', '6'];

  bool isLoading = false;

  List<MainScoresModel> scoreList = [];

  LiveTabController({this.match});

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  Future<void> initData () async {
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

}