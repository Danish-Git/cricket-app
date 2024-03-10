import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class DioSingleton {
  static final DioSingleton _singleton = DioSingleton._internal();

  factory DioSingleton() {
    return _singleton;
  }

  final Dio _dio;
  CancelToken _cancelToken = CancelToken();

  Dio get dio => _dio;

  DioSingleton._internal()
      : _dio = Dio(BaseOptions(
          baseUrl: '',
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        )) {
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
    );
  }

  void cancelRequests() {
    _cancelToken.cancel('Request canceled');
    _cancelToken = CancelToken();
  }
}

class ApiMethods {
  Dio dio = DioSingleton().dio;

  Duration timeOut = const Duration(seconds: 20);

  ApiResponse onCatchError(onError) =>
      ApiResponse(status: false, message: onError.toString());

  ApiResponse onTimeOut =
      ApiResponse(status: false, message: 'Request time-out');

  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  Map<String, String> headerWithToken() => {
        HttpHeaders.contentTypeHeader: 'application/json',
        'jwtToken': 'AppStatic.jwtTokenS',
        'userId': 'AppStatic.userIdS',
      };

  Map<String, String> headerWithTokenMultipart() => {
        HttpHeaders.contentTypeHeader: 'multipart/form-data',
        'jwtToken': 'AppStatic.jwtTokenS',
        'userId': 'AppStatic.userIdS',
      };

  Future<bool> checkInternetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  /*   *********************** API METHODS    ************************************ */

  /*  GET METHOD   */
  Future<ApiResponse> getRequest({required String url}) async {
    if (await checkInternetConnectivity()) {
      return dio
          .getUri(
            Uri.parse(url),
            options: Options(headers: headers),
            cancelToken: DioSingleton()._cancelToken,
          )
          .then((value) {
            if (value.statusCode == 200) {
              if (value.data['statusDescription']['statusCode'] == 200) {
                return ApiResponse(
                    status: true,
                    data: value.data,
                    message: value.data['statusDescription']['statusMessage']);
              } else {
                return ApiResponse(
                  status: false,
                  message: value.data['statusDescription']['statusMessage'],
                  statusCode: value.data['statusDescription']['statusCode'],
                );
              }
            } else {
              return ApiResponse(
                status: false,
                message: (json.decode(value.data).toString()),
                statusCode: json.decode(value.data)['statusDescription']
                    ['statusCode'],
              );
            }
          })
          .onError((error, stackTrace) => onCatchError(error))
          .catchError((onError) => onCatchError(onError))
          .timeout(timeOut, onTimeout: () => onTimeOut);
    } else {
      return ApiResponse(
          status: false, message: 'Please check internet connection');
    }
  }

  /*  GET METHOD  WITH HEADER */
  Future<ApiResponse> getRequestWithHeader({required String url}) async {
    if (await checkInternetConnectivity()) {
      return dio
          .getUri(
            Uri.parse(url),
            options: Options(headers: headerWithToken()),
            cancelToken: DioSingleton()._cancelToken,
          )
          .then((value) {
            if (value.statusCode == 200) {
              if (value.data['statusDescription']['statusCode'] == 200) {
                return ApiResponse(
                    status: true,
                    data: value.data,
                    message: value.data['statusDescription']['statusMessage']);
              } else {
                return ApiResponse(
                  status: false,
                  message: value.data['statusDescription']['statusMessage'],
                  statusCode: value.data['statusDescription']['statusCode'],
                );
              }
            } else {
              return ApiResponse(
                status: false,
                message: (json.decode(value.data).toString()),
                statusCode: json.decode(value.data)['statusDescription']
                    ['statusCode'],
              );
            }
          })
          .onError((error, stackTrace) => onCatchError(error))
          .catchError((onError) => onCatchError(onError))
          .timeout(timeOut, onTimeout: () => onTimeOut);
    } else {
      return ApiResponse(
          status: false, message: 'Please check internet connection');
    }
  }

  /*  POST METHOD */
  Future<ApiResponse> postRequest({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    if (await checkInternetConnectivity()) {
      return dio
          .postUri(
            Uri.parse(url),
            options: Options(headers: headers),
            data: FormData.fromMap(body),
            cancelToken: DioSingleton()._cancelToken,
          )
          .then((value) {
            if (value.statusCode == 200) {
              dynamic data = jsonDecode(value.data);
              if (data['status'] == true) {
                return ApiResponse(
                    status: true, data: data, message: data['message']);
              } else {
                return ApiResponse(
                  status: false,
                  message: data['statusDescription']['statusMessage'],
                  statusCode: data['statusDescription']['statusCode'],
                );
              }
            } else {
              return ApiResponse(
                status: false,
                message: (json.decode(value.data).toString()),
                statusCode: json.decode(value.data)['statusDescription']
                    ['statusCode'],
              );
            }
          })
          .onError((error, stackTrace) => onCatchError(error))
          .catchError((onError) => onCatchError(onError))
          .timeout(timeOut, onTimeout: () => onTimeOut);
    } else {
      return ApiResponse(
          status: false, message: 'Please check internet connection');
    }
  }

  /*  POST METHOD  WITH HEADER */
  Future<ApiResponse> postRequestWithHeader({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    if (await checkInternetConnectivity()) {
      return dio
          .postUri(
            Uri.parse(url),
            options: Options(headers: headerWithToken()),
            data: body,
            cancelToken: DioSingleton()._cancelToken,
          )
          .then((value) {
            if (value.statusCode == 200) {
              if (value.data['status'] == true) {
                return ApiResponse(
                  status: true,
                  data: value.data,
                  message: value.data['statusDescription']['statusMessage'] ??
                      'data sent',
                );
              } else {
                return ApiResponse(
                  status: false,
                  message: value.data['statusDescription']['statusMessage'],
                  statusCode: value.data['statusDescription']['statusCode'],
                );
              }
            } else {
              return ApiResponse(
                status: false,
                message: (json.decode(value.data).toString()),
                statusCode: json.decode(value.data)['statusDescription']
                    ['statusCode'],
              );
            }
          })
          .onError((error, stackTrace) => onCatchError(error))
          .catchError((onError) => onCatchError(onError))
          .timeout(timeOut, onTimeout: () => onTimeOut);
    } else {
      return ApiResponse(
          status: false, message: 'Please check internet connection');
    }
  }

/*  FILE UPLOAD API */

  Future<ApiResponse> fileUploadApi({
    required String url,
    required String number,
    required String paramName,
    required File file,
  }) async {
    if (await checkInternetConnectivity()) {
      String fileName = file.path.split('/').last;

      FormData formData = FormData.fromMap(
        {
          paramName: await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
          'Mobile': number,
        },
      );

      return dio
          .postUri(
            Uri.parse(url),
            data: formData,
            cancelToken: DioSingleton()._cancelToken,
          )
          .then((value) {
            if (value.statusCode == 200) {
              dynamic data = jsonDecode(value.data);
              if (data['status'] == true) {
                return ApiResponse(status: true, message: data['message']);
              } else {
                return ApiResponse(status: false, message: data['message']);
              }
            } else {
              return ApiResponse(
                status: false,
                message: (json.decode(value.data).toString()),
                statusCode: json.decode(value.data)['statusDescription']
                    ['statusCode'],
              );
            }
          })
          .onError((error, stackTrace) => onCatchError(error))
          .catchError((onError) => onCatchError(onError))
          .timeout(timeOut, onTimeout: () => onTimeOut);
    } else {
      return ApiResponse(
          status: false, message: 'Please check internet connection');
    }
  }

  Future<ApiResponse> fileUploadRegisterApi({
    required String url,
    required File file,
    required String mNumber,
    required String name,
    required String fName,
    required String mName,
    required String gender,
    required String dob,
    required String email,
    required String address,
    required String userType,
  }) async {
    if (await checkInternetConnectivity()) {
      String fileName = file.path.split('/').last;

      FormData formData = FormData.fromMap(
        {
          'AadharCard': await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
          'Mobile': mNumber,
          'PlayerName': name,
          'FatherName': fName,
          'MotherName': mName,
          'Gender': gender,
          'DateOfBirth': dob,
          'Email': email,
          'Address': address,
          'UserType': userType,
        },
      );

      return dio
          .postUri(
            Uri.parse(url),
            data: formData,
            cancelToken: DioSingleton()._cancelToken,
          )
          .then((value) {
            if (value.statusCode == 200) {
              dynamic data = jsonDecode(value.data);
              if (data['status'] == true) {
                return ApiResponse(status: true, message: data['message']);
              } else {
                return ApiResponse(status: false, message: data['message']);
              }
            } else {
              return ApiResponse(
                status: false,
                message: (json.decode(value.data).toString()),
                statusCode: json.decode(value.data)['statusDescription']
                    ['statusCode'],
              );
            }
          })
          .onError((error, stackTrace) => onCatchError(error))
          .catchError((onError) => onCatchError(onError))
          .timeout(timeOut, onTimeout: () => onTimeOut);
    } else {
      return ApiResponse(
          status: false, message: 'Please check internet connection');
    }
  }
}

class ApiResponse<T> {
  final int statusCode;
  final bool status;
  final String? message;
  final T? data;

  ApiResponse({
    required this.status,
    this.statusCode = 0,
    this.message,
    this.data,
  });
}
