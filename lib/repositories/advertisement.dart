import '../api_methods/api_constants.dart';
import '../api_methods/api_methods.dart';
import '../models/ads.dart';

class AdvertisementRepository {

  Future<ApiResponse> getAdvertisementList() {
    return ApiMethods().postRequest(url: getAdvertisementsUrl, body: {}).then((value) {
      List<AdsModel> adsList = [];
      if (value.data != null) {
        for (var element in (value.data["data"])) {
          adsList.add(AdsModel.fromJson(element));
        }
      }
      return ApiResponse(status: value.status, data: adsList, message: value.message);
    }).catchError((error) => ApiResponse(status: false, message: error.toString()))
        .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }

}