import 'package:cricket/models/top_players.dart';

import '../api_methods/api_constants.dart';
import '../api_methods/api_methods.dart';
import '../models/points_table.dart';
import '../models/team.dart';
import '../response_dir/tournament_model.dart';

class TournamentsRepository {

  Future<ApiResponse> getTournamentsList(Map<String, dynamic> params) {
    return ApiMethods().postRequest(url: getAllTournamentsList, body: params)
      .then((value) {
        List<TournamentModel> tournamentList = [];
        if (value.data != null) {
          for (var element in (value.data["data"])) {
            tournamentList.add(TournamentModel.fromJson(element));
          }
        }
        return ApiResponse(status: value.status, data: tournamentList, message: value.message);
    }).catchError((error) => ApiResponse(status: false, message: error.toString()))
        .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }

  Future<ApiResponse> getPointsTable(Map<String, dynamic> params) {
    return ApiMethods().postRequest(url: pointsTableOfTournamentsUrl, body: params).then((value) {
      List<PointTableModel> pointTableList = [];
      if (value.data != null) {
        for (var element in (value.data["data"])) {
          pointTableList.add(PointTableModel.fromJson(element));
        }
      }
      return ApiResponse(status: value.status, data: pointTableList, message: value.message);
    }).catchError((error) => ApiResponse(status: false, message: error.toString()))
      .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }

  Future<ApiResponse> getTopPlayer(Map<String, dynamic> params, bool isRun) {
    return ApiMethods().postRequest(url: isRun ? topRunOfTournamentsUrl : wicketsOfTournamentsUrl, body: params).then((value) {
      List<TopPlayersModel> topPlayer = [];
      if (value.data != null) {
        for (var element in (value.data["data"])) {
          topPlayer.add(TopPlayersModel.fromJson(element));
        }
      }
      return ApiResponse(status: value.status, data: topPlayer, message: value.message);
    }).catchError((error) => ApiResponse(status: false, message: error.toString()))
      .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }

  Future<ApiResponse> getWinnerTeams(Map<String, dynamic> params) {
    return ApiMethods().postRequest(url: winnerOfTournamentsUrl, body: params).then((value) {
      List<TeamModel> teams = [];
      if (value.data != null) {
        for (var element in (value.data["data"])) {
          teams.add(TeamModel.fromJson(element));
        }
      }
      return ApiResponse(status: value.status, data: teams, message: value.message);
    }).catchError((error) => ApiResponse(status: false, message: error.toString()))
      .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }

  Future<ApiResponse> getPlayingTeams(Map<String, dynamic> params) {
    return ApiMethods().postRequest(url: playingTeamsOfTournamentsUrl, body: params).then((value) {
      List<TeamModel> teams = [];
      if (value.data != null) {
        for (var element in (value.data["data"])) {
          teams.add(TeamModel.fromJson(element));
        }
      }
      return ApiResponse(status: value.status, data: teams, message: value.message);
    }).catchError((error) => ApiResponse(status: false, message: error.toString()))
      .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }

}