import 'package:cricket/live_tv_dir/live_match_detail/live_tv_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_utils/app_static.dart';
import '../../app_utils/ad_banner/index.dart';
import '../../app_utils/color_constants.dart';
import '../../app_utils/scaffold.dart';
import '../../models/match.dart';
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
                      GridView.builder(
                        itemCount: controller.matchList.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Material(
                            borderRadius:  BorderRadius.circular(15),
                            child: InkWell(
                              borderRadius:  BorderRadius.circular(15),
                              onTap: () => controller.onTapMatch(controller.matchList[index]),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    height: 180,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      borderRadius:  BorderRadius.circular(15),
                                    ),
                                    child: ClipRRect(
                                      borderRadius:  BorderRadius.circular(15),
                                      child: Image.network(
                                        controller.matchList[index].banner ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                                    decoration: BoxDecoration(
                                      borderRadius:  BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: const [0.1, 0.4, 0.6, 0.9,],
                                        colors: [
                                          ColorConstants().blackColor.withOpacity(0.0),
                                          ColorConstants().blackColor.withOpacity(0.4),
                                          ColorConstants().blackColor.withOpacity(0.6),
                                          ColorConstants().blackColor.withOpacity(0.9),
                                        ],
                                      ),
                                    ),
                                    child: matchDetails(controller.matchList[index]),
                                  )
                                ],
                              ),
                            ),
                          );
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

  Widget matchDetails(MatchModel match) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              match.teamNickName1 ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'VS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          Flexible(
            child: Text(
              match.teamNickName2 ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
