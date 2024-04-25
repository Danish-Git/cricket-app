import 'package:get/get.dart';

import '../../../api_methods/api_methods.dart';
import '../../../app_utils/constants/navigation_params.dart';
import '../../../app_utils/helper.dart';
import '../../../models/player.dart';
import '../../../models/team.dart';
import '../../../repositories/teams.dart';
import '../../../routing_dir/app_screen_const.dart';

class TeamDetailController extends GetxController {
  List<PlayerModel> playerList = [];

  bool isLoading = false;

  TeamModel? teamModel = Get.arguments?[NavParamsConstants.team];

  @override
  void onInit() {
    super.onInit();
    getTeamDetails();
  }

  void getTeamDetails() async {
    try {
      toggleLoading();
      Map<String, dynamic> params = {
        'TeamID': teamModel?.teamID ??''
      };

      ApiResponse response = await TeamsRepository().getTeamDetail(params);
      if(response.status) {
        teamModel = response.data.first;
      } else {
        Helper.showToast(response.message ?? '');
      }
    } catch (e) {
      Helper.showToast(e.toString());
      rethrow;
    } finally {
      getPlayersList();
    }
  }

  void getPlayersList() async {
    try {
      playerList.clear();
      Map<String, dynamic> params = {
        'TeamID': teamModel?.teamID ??''
      };

      ApiResponse response = await TeamsRepository().getPlayersList(params);
      if(response.status) {
        playerList = response.data;
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
