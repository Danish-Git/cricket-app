import 'package:cricket/app_utils/constants/navigation_params.dart';
import 'package:get/get.dart';

import '../../api_methods/api_methods.dart';
import '../../app_utils/helper.dart';
import '../../models/match.dart';
import '../../repositories/match.dart';
import '../../routing_dir/app_screen_const.dart';

class LiveController extends GetxController {

  final String tournamentID = '3';

  bool isLoading = false;

  List<MatchModel> matchList = [];
  
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
  
  //////////////////

  List<String> images = [
    'https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png',
    'https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png',
    'https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png',
    'https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png'
  ];

  onTapMatch(MatchModel match) {
    Get.toNamed(AppScreenConst.liveMatchDetailsScreen, arguments: {
      NavParamsConstants.liveMatch : match,
      NavParamsConstants.isLive : true,
    });
  }
}
