import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_utils/color_constants.dart';
import '../app_utils/custom_carousel.dart';
import '../app_utils/image_utils.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body: controller.isLoading
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
                                      onTap: () {},
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
                                const SizedBox(height: 24),
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
                                Center(
                                  child: Text(
                                    'Question',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstants().redColor,
                                    ),
                                  ),
                                ),
                                // const Divider(
                                //   color: Color.fromRGBO(0, 0, 0, 0.07),
                                //   thickness: 1,
                                //   indent: 32,
                                //   endIndent: 32,
                                // ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 150,
                        margin: const EdgeInsets.only(top: 16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 1),
                              spreadRadius: 2,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Text(
                                controller.questionList[0].Question,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstants().redColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AnswerWgt(
                                  txt: controller.questionList[0].Option1,
                                  isSelected: controller.selectedAns == 0,
                                ),
                                AnswerWgt(
                                  txt: controller.questionList[0].Option2,
                                  isSelected: controller.selectedAns == 1,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AnswerWgt(
                                  txt: controller.questionList[0].Option3,
                                  isSelected: controller.selectedAns == 3,
                                ),
                                AnswerWgt(
                                  txt: controller.questionList[0].Option4,
                                  isSelected: controller.selectedAns == 4,
                                ),
                              ],
                            ),
                          ],
                        ),
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
        floatingActionButton: const Icon(Icons.shopping_cart),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: controller.iconList,
          activeIndex: 0,
          activeColor: Colors.green,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.verySmoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) {},
        ),
      ),
    );
  }
}

class AnswerWgt extends StatelessWidget {
  final String txt;
  final bool isSelected;

  const AnswerWgt({super.key, required this.txt, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: Get.width * 0.4,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
              ? ColorConstants().greenColor
              : const Color.fromRGBO(0, 0, 0, 0.5),
        ),
        borderRadius: BorderRadius.circular(6),
        color: isSelected ? ColorConstants().greenColor : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            txt,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: isSelected
                  ? ColorConstants().whiteColor
                  : const Color.fromRGBO(0, 0, 0, 0.5),
            ),
          ),
          Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? ColorConstants().whiteColor : Colors.white70,
              border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.5)),
            ),
            child: Icon(
              Icons.done,
              color: isSelected ? ColorConstants().greenColor : Colors.white,
              size: 12,
            ),
          )
        ],
      ),
    );
  }
}
