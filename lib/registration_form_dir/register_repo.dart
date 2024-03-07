import 'dart:io';
import '../api_methods/api_constants.dart';
import '../api_methods/api_methods.dart';

class RegisterRepo {
  final ApiMethods _apiMethods = ApiMethods();

  Future<ApiResponse> saveUserRegistrationDetailApi({
    required String mNumber,
    required String name,
    required String fName,
    required String mName,
    required String gender,
    required String dob,
    required String email,
    required String address,
    required String userType,
    required File imgName,
  }) {
    return _apiMethods
        .fileUploadRegisterApi(
          url: saveUserRegistrationDetailUrl,
          mNumber: mNumber,
          address: address,
          dob: dob,
          email: email,
          file: imgName,
          fName: fName,
          gender: gender,
          mName: mName,
          name: name,
          userType: userType,
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

  Future<ApiResponse> userRegistrationDetailApi({required String mNumber}) {
    return _apiMethods.postRequest(
        url: getUserRegistrationDetailUrl, body: {'Mobile': mNumber}).then(
      (value) => ApiResponse(
        status: value.status,
        data: value.status ? value.data : null,
        message: value.message,
        statusCode: value.statusCode,
      ),
    );
  }
}
