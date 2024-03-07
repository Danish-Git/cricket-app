import 'package:carousel_slider/carousel_slider.dart';
import 'package:cricket/player_profile_dir/player_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_utils/custom_carousel.dart';
import '../app_utils/image_utils.dart';
import '../routing_dir/app_screen_const.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: Get.width * 0.7,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: SvgImgUtils(
                                imgName: 'assets/down_dot.svg',
                                wth: double.infinity,
                                hgt: Get.width,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(()=>const PlayerProfileScreen());
                                        // Get.toNamed(AppScreenConst.userProfile);
                                      },
                                      child: CircleAvatar(
                                        radius: 26,
                                        backgroundImage: NetworkImage(
                                          controller.userImg,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '  ${controller.userName}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color.fromRGBO(0, 116, 56, 1),
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        controller.onNotificationTap();
                                      },
                                      icon: const Icon(
                                        Icons.notifications,
                                        size: 32,
                                      ),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    'Running Matches',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                ),
                                CustomCarousel(
                                  boxHgt: 190,
                                  boxWdt: Get.width * 0.95,
                                  itemList: controller.runningTournament,
                                  index: controller.runningIndex,
                                  carouselController:
                                      controller.runningCarouselController,
                                  onPageChanged: (index, _) {
                                    controller.onRunningChange(index);
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 24,
                          bottom: 8,
                          left: 18,
                          right: 18,
                        ),
                        child: Text(
                          'Up Coming Matches',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                      CustomCarousel(
                        boxHgt: 190,
                        boxWdt: Get.width * 0.95,
                        itemList: controller.upComingTournament,
                        index: controller.upComingIndex,
                        carouselController:
                            controller.upComingCarouselController,
                        onPageChanged: (index, _) {
                          controller.onUpComingChange(index);
                        },
                      ),
                      //////
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 24,
                          bottom: 8,
                          left: 18,
                          right: 18,
                        ),
                        child: Text(
                          'Running Matches',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                      CustomCarousel(
                        boxHgt: 190,
                        boxWdt: Get.width * 0.95,
                        itemList: controller.runningTournament,
                        index: controller.runningIndex,
                        carouselController:
                            controller.runningCarouselController,
                        onPageChanged: (index, _) {
                          controller.onRunningChange(index);
                        },
                      ),

                      ///////

                      const Padding(
                        padding: EdgeInsets.only(
                          top: 24,
                          bottom: 8,
                          left: 18,
                          right: 18,
                        ),
                        child: Text(
                          'Completed Matches',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 190,
                        width: Get.width * 0.95,
                        child: CarouselSlider(
                          items: controller.completeTournament,
                          carouselController:
                              controller.completedCarouselController,
                          options: CarouselOptions(
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 2),
                              enlargeCenterPage: true,
                              aspectRatio: 2.0,
                              onPageChanged: (index, reason) {
                                controller.onCompletedChange(index);
                              }),
                        ),
                      ),

                      ///////////////

                      const Padding(
                        padding: EdgeInsets.only(
                          top: 24,
                          bottom: 8,
                          left: 18,
                          right: 18,
                        ),
                        child: Text(
                          'Cancelled Matches',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 190,
                        width: Get.width * 0.95,
                        child: CarouselSlider(
                          items: controller.cancelTournament,
                          carouselController:
                              controller.cancelCarouselController,
                          options: CarouselOptions(
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 2),
                              enlargeCenterPage: true,
                              aspectRatio: 2.0,
                              onPageChanged: (index, reason) {
                                controller.onCancelChange(index);
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
