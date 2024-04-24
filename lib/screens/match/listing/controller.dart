import 'package:get/get.dart';

import '../../../api_methods/api_methods.dart';
import '../../../app_utils/helper.dart';
import '../../../models/match.dart';
import '../../../repositories/match.dart';

class MatchListingController extends GetxController {

  final String? tournamentID;

  bool isLoading = false;

  List<MatchModel> matchList = [];

  MatchListingController({required this.tournamentID});

  @override
  void onInit() {
    super.onInit();
    getMatchList();
  }

  void getMatchList() async {
    try {
      matchList.clear();
      toggleLoading();
      Map<String, dynamic> params = {
        'TournamentsID': tournamentID
      };

      ApiResponse response = await MatchRepository().getMatchList(params);
      if(response.status) {
        matchList = response.data;
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

  void onTapMatch(MatchModel matchList) {

  }

}