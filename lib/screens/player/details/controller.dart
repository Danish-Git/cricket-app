import 'package:get/get.dart';

import '../../../api_methods/api_methods.dart';
import '../../../app_utils/constants/navigation_params.dart';
import '../../../app_utils/helper.dart';
import '../../../models/player.dart';
import '../../../repositories/player.dart';

class PlayerDetailScreenController extends GetxController {

  bool isLoading = false;

  PlayerModel? player = Get.arguments?[NavParamsConstants.player];

  @override
  void onInit() {
    super.onInit();
    getPlayerDetails();
  }

  void getPlayerDetails() async {
    try {
      toggleLoading();
      Map<String, dynamic> params = {
        'PlayerID': player?.playerID ??''
      };

      ApiResponse response = await PlayersRepository().getPlayerDetails(params);
      if(response.status) {
        player = response.data.first;
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