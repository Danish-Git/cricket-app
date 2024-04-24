import 'package:cricket/models/team.dart';
import 'package:get/get.dart';

import '../../../../../api_methods/api_methods.dart';
import '../../../../../app_utils/helper.dart';
import '../../../../../repositories/tournaments.dart';

class WinnersScreenController extends GetxController {
  final String? tournamentID;

  bool isLoading = false;

  List<TeamModel> teamList = [];

  WinnersScreenController({required this.tournamentID});

  @override
  void onInit() {
    super.onInit();
    getWinnerList();
  }

  void getWinnerList() async {
    try {
      teamList.clear();
      toggleLoading();
      Map<String, dynamic> params = {
        'TournamentsID': tournamentID
      };

      ApiResponse response = await TournamentsRepository().getWinnerTeams(params);
      if(response.status) {
        teamList = response.data;
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