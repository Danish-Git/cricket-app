import 'package:get/get.dart';

import '../../../../../api_methods/api_methods.dart';
import '../../../../../app_utils/helper.dart';
import '../../../../../models/points_table.dart';
import '../../../../../repositories/tournaments.dart';

class PointsTableScreenController extends GetxController {

  final String? tournamentID;

  bool isLoading = false;

  List<PointTableModel> pointTableList = [];

  PointsTableScreenController({required this.tournamentID});

  @override
  void onInit() {
    super.onInit();
    getMatchList();
  }

  void getMatchList() async {
    try {
      pointTableList.clear();
      toggleLoading();
      Map<String, dynamic> params = {
        'TournamentsID': tournamentID
      };

      ApiResponse response = await TournamentsRepository().getPointsTable(params);
      if(response.status) {
        pointTableList = response.data;
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