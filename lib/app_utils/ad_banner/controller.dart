import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import '../../api_methods/api_methods.dart';
import '../../models/ads.dart';
import '../../repositories/advertisement.dart';
import '../helper.dart';
import 'ad_details/index.dart';

class AdsSliderController extends GetxController {

  final CarouselController carouselController = CarouselController();

  List<AdsModel> adsList = [];

  int currentCarousel = 0;

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    loadAds();
  }

  Future<void> loadAds() async {
    try {
      adsList.clear();
      toggleLoading();

      ApiResponse response = await AdvertisementRepository().getAdvertisementList();
      if(response.status) {
        adsList = response.data;
      } else {
        Helper.showToast(response.message ?? '');
      }
    } catch (e) {
      Helper.showToast(e.toString());
      rethrow;
    } finally {
      toggleLoading();
    }
  }

  void toggleLoading() {
    isLoading = !isLoading;
    update();
  }


  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentCarousel = index;
    update();
  }

  Future<void> loadAdd(AdsModel adModel) async {
    await Get.bottomSheet(
        AdDialogue(adModel: adModel),
        enableDrag: false,
        isDismissible: false
    );
  }

}