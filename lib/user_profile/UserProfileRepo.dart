import 'dart:io';
import '../api_methods/api_constants.dart';
import '../api_methods/api_methods.dart';
import '../app_utils/app_static.dart';

class UserProfileRepo {
  final ApiMethods _apiMethods = ApiMethods();

  Future<ApiResponse> getUserProfile() {
    return _apiMethods.postRequest(
        url: getUserProfileUrl + AppStatic.userId,
        body: {'Mobile': AppStatic.userNumber}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  Future<ApiResponse> updateUserProfileDetails({
    required String userName,
    required String email,
  }) {
    Map<String, dynamic> body = {
      'Mobile': AppStatic.userNumber,
      'UserName': userName,
      'Email': email,
    };
    return _apiMethods.postRequest(url: updateUserProfileUrl, body: body).then(
          (value) => ApiResponse(
            status: value.status,
            data: value.status ? value.data : null,
            message: value.message,
            statusCode: value.statusCode,
          ),
        );
  }

  Future<ApiResponse> updateUserProfileImg({required File fileName}) {
    return _apiMethods
        .fileUploadApi(
          url: updateUserProfileImageUrl,
          number: AppStatic.userNumber,
          paramName: 'ProfilePicture',
          file: fileName,
        )
        .then(
          (value) => ApiResponse(
            status: value.status,
            data: value.status ? value.data : null,
            message: value.message,
            statusCode: value.statusCode,
          ),
        );
  }
}
