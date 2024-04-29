

import '../api_methods/api_constants.dart';
import '../api_methods/api_methods.dart';
import '../models/main_scores.dart';
import '../models/match.dart';

class MatchRepository {

  Future<ApiResponse> getMatchList(Map<String, dynamic> params) {
    return ApiMethods().postRequest(url: matchList, body: params).then((value) {
      List<MatchModel> matchList = [];
      if (value.data != null) {
        for (var element in (value.data["data"])) {
          matchList.add(MatchModel.fromJson(element));
        }
      }
      return ApiResponse(status: value.status, data: matchList, message: value.message);
    }).catchError((error) => ApiResponse(status: false, message: error.toString()))
        .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }

  Future<ApiResponse> getMatchScores(Map<String, dynamic> params) {
    return ApiMethods().postRequest(url: matchList, body: params).then((value) {
      List<MainScoresModel> matchScore = [];
      if (value.data != null) {
        for (var element in (value.data["data"])) {
          matchScore.add(MainScoresModel.fromJson(element));
        }
      }
      return ApiResponse(status: value.status, data: matchScore, message: value.message);
    }).catchError((error) => ApiResponse(status: false, message: error.toString()))
        .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }

}