import '../api_methods/api_constants.dart';
import '../api_methods/api_methods.dart';

class LoginRepo {
  final ApiMethods _apiMethods = ApiMethods();

  Future<ApiResponse> userRegister(
      {required String number, required String token}) {
    return _apiMethods.postRequest(
        url: loginUrl, body: {'Mobile': number, 'DeviceToken': token}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }
}
