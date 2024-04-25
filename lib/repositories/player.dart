import '../api_methods/api_constants.dart';
import '../api_methods/api_methods.dart';
import '../models/player.dart';

class PlayersRepository {
  Future<ApiResponse> getPlayerDetails(Map<String, dynamic> params) {
    return ApiMethods().postRequest(url: getPlayerDetailsUrl, body: params).then((value) {
      List<PlayerModel> playersList = [];
      if (value.data != null) {
        for (var element in (value.data["data"])) {
          playersList.add(PlayerModel.fromJson(element));
        }
      }
      return ApiResponse(status: value.status, data: playersList, message: value.message);
    }).catchError((error) => ApiResponse(status: false, message: error.toString()))
        .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }
}