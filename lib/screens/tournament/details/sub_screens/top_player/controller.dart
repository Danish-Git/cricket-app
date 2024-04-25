import 'package:get/get.dart';

import '../../../../../api_methods/api_methods.dart';
import '../../../../../app_utils/helper.dart';
import '../../../../../models/top_players.dart';
import '../../../../../repositories/tournaments.dart';

class TopPlayerScreenController extends GetxController {

  final String? tournamentID;

  bool isLoading = false;
  bool isRun = false;

  List<TopPlayersModel> topPlayers = [];

  TopPlayerScreenController({required this.tournamentID, required this.isRun});

  @override
  void onInit() {
    super.onInit();
    getMatchList();
  }

  void getMatchList() async {
    try {
      topPlayers.clear();
      toggleLoading();
      Map<String, dynamic> params = {
        if (isRun)...{'TournamentID': tournamentID,}
        else...{'TournamentsID': tournamentID,}
      };

      ApiResponse response = await TournamentsRepository().getTopPlayer(params, isRun);
      if(response.status) {
        topPlayers = response.data;
      } else {
        Helper.showToast(response.message ?? '');
      }
    } catch (e) {
      Helper.showToast(e.toString());
      rethrow;
    } finally {
      toggleLoading();
    }
  }

  void toggleLoading() {
    isLoading = !isLoading;
    update();
  }

}