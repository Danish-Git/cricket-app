import 'package:cricket/app_utils/constants/navigation_params.dart';
import 'package:get/get.dart';

import '../../../../../api_methods/api_methods.dart';
import '../../../../../app_utils/helper.dart';
import '../../../../../models/team.dart';
import '../../../../../repositories/tournaments.dart';
import '../../../../../routing_dir/app_screen_const.dart';

class PlayingTeamsScreenController extends GetxController {

  final String? tournamentID;

  bool isLoading = false;

  List<TeamModel> teamsList = [];

  PlayingTeamsScreenController({required this.tournamentID});

  @override
  void onInit() {
    super.onInit();
    getMatchList();
  }

  void getMatchList() async {
    try {
      teamsList.clear();
      toggleLoading();
      Map<String, dynamic> params = {
        'TournamentsID': tournamentID
      };

      ApiResponse response = await TournamentsRepository().getPlayingTeams(params);
      if(response.status) {
        teamsList = response.data;
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

  void navigateToDetailScreen(TeamModel team) {
    Get.toNamed(AppScreenConst.teamDetail, arguments: {NavParamsConstants.team: team});
  }
}