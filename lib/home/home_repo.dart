import '../api_methods/api_constants.dart';
import '../api_methods/api_methods.dart';

class HomeRepo {
  final ApiMethods _apiMethods = ApiMethods();

  Future<ApiResponse> getALlTournamentsHome() {
    return _apiMethods.postRequest(
        url: getALlTournamentsUrl, body: {'TournamentsID': '3'}).then(
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
    return _apiMethods.postRequest(url: getALlNotificationsUrl, body: {}).then(
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
        url: updateNotificationsUrl,
        body: {'Mobile': number, 'NotificationID': notificationID}).then(
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
        url: getALlMatchesOfTournamentsUrl, body: {'TournamentsID': '3'}).then(
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
        url: pointsTableOfTournamentsUrl, body: {'TournamentsID': '3'}).then(
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
        url: topRunOfTournamentsUrl, body: {'TournamentID': '3'}).then(
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
        url: wicketsOfTournamentsUrl, body: {'TournamentsID': '3'}).then(
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
        url: winnerOfTournamentsUrl, body: {'TournamentsID': '3'}).then(
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
        url: playingTeamsOfTournamentsUrl, body: {'TournamentsID': '3'}).then(
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
        url: getBoundaryTournamentsUrl, body: {'TournamentsID': '3'}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }
}
