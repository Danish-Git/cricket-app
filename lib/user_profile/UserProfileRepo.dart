import 'dart:io';
import '../api_methods/api_constants.dart';
import '../api_methods/api_methods.dart';

class UserProfileRepo {
  final ApiMethods _apiMethods = ApiMethods();

  Future<ApiResponse> getUserProfile({required String number}) {
    return _apiMethods
        .postRequest(url: getUserProfileUrl, body: {'Mobile': number}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }

  Future<ApiResponse> updateUserProfileImg({
    required String number,
    required File fileName,
  }) {
    return _apiMethods
        .fileUploadApi(
          url: updateUserProfileImageUrl,
          number: number,
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
