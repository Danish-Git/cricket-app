import 'package:cricket/app_utils/app_static.dart';

import '../api_methods/api_constants.dart';
import '../api_methods/api_methods.dart';

class HomeRepo {
  final ApiMethods _apiMethods = ApiMethods();

  Future<ApiResponse> getQuizQuestionHome() {
    return _apiMethods.postRequest(url: getQuizQuestionUrl, body: {}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  Future<ApiResponse> saveQuizQuestionAnswerHome({
    required String mobile,
    required String quizId,
    required String answer,
  }) {
    return _apiMethods.postRequest(url: saveQuizAnswerUrl, body: {
      'Mobile': mobile,
      'QuizID': quizId,
      'Answer': answer,
    }).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  Future<ApiResponse> getALlTournamentsHome() {
    return _apiMethods.postRequest(
        url: getALlTournamentsUrl + AppStatic.userId,
        body: {'TournamentsID': '3'}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  //////////  notification

  Future<ApiResponse> getAllNotificationsApi() {
    return _apiMethods.postRequest(
        url: getALlNotificationsUrl + AppStatic.userId, body: {}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  Future<ApiResponse> updateNotificationsApi(
      {required String number, required String notificationID}) {
    return _apiMethods.postRequest(
        url: updateNotificationsUrl + AppStatic.userId,
        body: {
          'Mobile': AppStatic.userNumber,
          'NotificationID': notificationID
        }).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  /////////  api for chip

  Future<ApiResponse> getALlTournamentsMatches() {
    return _apiMethods.postRequest(
        url: getALlMatchesOfTournamentsUrl + AppStatic.userId,
        body: {'TournamentsID': '3'}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  Future<ApiResponse> getPointsTableHomeApi() {
    return _apiMethods.postRequest(
        url: pointsTableOfTournamentsUrl + AppStatic.userId,
        body: {'TournamentsID': '3'}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  //////
  Future<ApiResponse> getTopRunnerHomeApi() {
    return _apiMethods.postRequest(
        url: topRunOfTournamentsUrl + AppStatic.userId,
        body: {'TournamentID': '3'}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  //////
  Future<ApiResponse> getTopWicketsHomeApi() {
    return _apiMethods.postRequest(
        url: wicketsOfTournamentsUrl + AppStatic.userId,
        body: {'TournamentsID': '3'}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  //////
  Future<ApiResponse> getWinnerHomeApi() {
    return _apiMethods.postRequest(
        url: winnerOfTournamentsUrl + AppStatic.userId,
        body: {'TournamentsID': '3'}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  //////
  Future<ApiResponse> getPlayingTeamHomeApi() {
    return _apiMethods.postRequest(
        url: playingTeamsOfTournamentsUrl + AppStatic.userId,
        body: {'TournamentsID': '3'}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  //////
  Future<ApiResponse> getBoundaryHomeApi() {
    return _apiMethods.postRequest(
        url: getBoundaryTournamentsUrl + AppStatic.userId,
        body: {'TournamentsID': '3'}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }
}
