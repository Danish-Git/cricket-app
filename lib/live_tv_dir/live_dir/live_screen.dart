import 'package:cricket/live_tv_dir/live_match_detail/live_tv_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_utils/app_static.dart';
import '../../app_utils/ad_banner/index.dart';
import '../../app_utils/scaffold.dart';
import 'live_controller.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveController>(
      init: LiveController(),
      builder: (controller) {
        return CustomScaffold(
          setDefaultAppBar: true,
          titleText: AppStatic.userName.isEmpty
              ? 'Cricket Club'
              : '  ${AppStatic.userName}',
          userImg: AppStatic.userProfileImage,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AdsSlider(
                  // boxHgt: Get.width * 0.5,
                  // boxWdt: double.maxFinite,
                  // itemList: controller.completeTournament,
                  // index: controller.completedIndex,
                  // carouselController: controller.completedCarouselController,
                  // onPageChanged: (index, _) {
                  //   controller.onCompletedChange(index);
                  // },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Highlights',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      SizedBox(
                        height: 400,
                        child: GridView.builder(
                          itemCount: controller.images.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => const LiveTvScreen());
                              },
                              child: Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Colors.transparent),
                                ),
                                child: Image.network(controller.images[index]),
                              ),
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12, bottom: 12),
                        child: Text(
                          'Promotional Content',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                      const AdsSlider(
                        // boxHgt: Get.width * 0.5,
                        // boxWdt: double.maxFinite,
                        // itemList: controller.completeTournament,
                        // index: controller.completedIndex,
                        // carouselController:
                        //     controller.completedCarouselController,
                        // onPageChanged: (index, _) {
                        //   controller.onCompletedChange(index);
                        // },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
