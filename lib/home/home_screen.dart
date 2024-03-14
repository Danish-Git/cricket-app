import 'package:cricket/home/ui_components/notification_wgt/notification_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_utils/color_constants.dart';
import '../app_utils/custom_carousel.dart';
import '../app_utils/image_utils.dart';
import 'home_controller.dart';
import 'ui_components/quiz_section/index.dart';

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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 12, top: 20, bottom: 24),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 26,
                                      backgroundImage: NetworkImage(
                                        controller.userImg,
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
                                        NotificationUtils().onNotificationTap(
                                          controller.notificationList,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.notifications_outlined,
                                        size: 32,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              CustomCarousel(
                                boxHgt: Get.width * 0.5,
                                boxWdt: double.maxFinite,
                                itemList: controller.completeTournament,
                                index: controller.completedIndex,
                                carouselController:
                                    controller.completedCarouselController,
                                onPageChanged: (index, _) {
                                  controller.onCompletedChange(index);
                                },
                              ),
                              const SizedBox(height: 16),
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
                            ],
                          )
                        ],
                      ),
                      QuizSection(controller: controller),
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
                        boxHgt: Get.width * 0.5,
                        boxWdt: double.infinity,
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
                        boxHgt: Get.width * 0.5,
                        boxWdt: double.infinity,
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

                      CustomCarousel(
                        boxHgt: Get.width * 0.5,
                        boxWdt: double.infinity,
                        itemList: controller.completeTournament,
                        index: controller.completedIndex,
                        carouselController:
                            controller.completedCarouselController,
                        onPageChanged: (index, _) {
                          controller.onCompletedChange(index);
                        },
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

                      CustomCarousel(
                        boxHgt: Get.width * 0.5,
                        boxWdt: double.infinity,
                        itemList: controller.cancelTournament,
                        index: controller.cancelIndex,
                        carouselController: controller.cancelCarouselController,
                        onPageChanged: (index, _) {
                          controller.onCancelChange(index);
                        },
                      ),
                    ],
                  ),
                ),
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
                  ? ColorConstants.whiteColor
                  : const Color.fromRGBO(0, 0, 0, 0.5),
            ),
          ),
          Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? ColorConstants.whiteColor : Colors.white70,
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
