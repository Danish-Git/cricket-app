import '../api_methods/api_constants.dart';
import '../api_methods/api_methods.dart';
import '../models/player.dart';
import '../models/team.dart';

class TeamsRepository {
  Future<ApiResponse> getPlayersList(Map<String, dynamic> params) {
    return ApiMethods().postRequest(url: getTeamPlayersUrl, body: params).then((value) {
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

  Future<ApiResponse> getTeamDetail(Map<String, dynamic> params) {
    return ApiMethods().postRequest(url: getTeamDetailsUrl, body: params).then((value) {
      List<TeamModel> teamList = [];
      if (value.data != null) {
        for (var element in (value.data["data"])) {
          teamList.add(TeamModel.fromJson(element));
        }
      }
      return ApiResponse(status: value.status, data: teamList, message: value.message);
    }).catchError((error) => ApiResponse(status: false, message: error.toString()))
        .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }
}