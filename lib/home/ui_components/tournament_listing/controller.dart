import 'package:cricket/app_utils/helper.dart';
import 'package:get/get.dart';

import '../../../api_methods/api_methods.dart';
import '../../../app_utils/constants/navigation_params.dart';
import '../../../repositories/tournaments.dart';
import '../../../response_dir/tournament_model.dart';
import '../../../routing_dir/app_screen_const.dart';

class TournamentListingController extends GetxController {

  final String gender;
  final String type;

  bool isLoading = false;

  List<TournamentModel> tournamentList = [];

  TournamentListingController({required this.gender, required this.type}) {
    initData();
  }

  void initData() async {
    await loadTournamentsList();
  }

  Future<void> loadTournamentsList() async {
    try {
      Map<String, dynamic> params = {
        'Status': type,
        'Gender': gender
      };
      tournamentList = [];
      toggleLoading();
      ApiResponse response = await TournamentsRepository().getTournamentsList(params);
      if(response.status) {
        tournamentList = response.data;
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

  void toggleLoading () {
    isLoading = !isLoading;
    update();
  }



  void onTapTournament(TournamentModel tournament) {
    Get.toNamed(AppScreenConst.tournamentDetail, arguments: {NavParamsConstants.tournament: tournament});
  }
}