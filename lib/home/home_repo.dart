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
