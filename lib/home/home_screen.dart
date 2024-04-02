import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:cricket/app_utils/app_static.dart';
import 'package:cricket/app_utils/scaffold.dart';
import 'package:cricket/routing_dir/app_screen_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_utils/color_constants.dart';
import '../app_utils/custom_carousel.dart';
import 'home_controller.dart';
import 'ui_components/quiz_section/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => CustomScaffold(
              setDefaultAppBar: true,
              titleText: AppStatic.userName.isEmpty
                  ? 'Cricket Club'
                  : '  ${AppStatic.userName}',
              userImg: AppStatic.userProfileImage.isNotEmpty
                  ? AppStatic.userProfileImage
                  : AppStatic.tempImg,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    QuizSection(controller: controller),

                    /////////// select your team

                    const Padding(
                      padding: EdgeInsets.only(left: 24, top: 24, bottom: 8),
                      child: Row(
                        children: [
                          Text(
                            'Select your team',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: controller.teamListController,
                              itemCount: controller.teamList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppScreenConst.teamDetail);
                                  },
                                  child: ContainerItem(
                                    imgName: controller.teamList[index],
                                    label: index.toString(),
                                  ),
                                );
                              }),
                        ),
                        Positioned(
                          right: 18,
                          top: 30,
                          bottom: 30,
                          child: GestureDetector(
                            onTap: () {
                              controller.teamListController.animateTo(
                                controller.teamListController.position
                                    .maxScrollExtent,
                                curve: Curves.easeOut,
                                duration: const Duration(milliseconds: 300),
                              );
                            },
                            child: Container(
                              width: 40,
                              decoration: BoxDecoration(
                                color: ColorConstants().greenColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                Icons.keyboard_arrow_right_sharp,
                                color: Colors.white,
                                size: 36,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    ///   Up Coming Tournament
                    if (controller.upComingTournament.isNotEmpty)
                      tournamentView(
                          title: 'Up Coming Tournament',
                          mainList: controller.upComingTournament,
                          index: controller.upComingIndex,
                          carouselController:
                              controller.upComingCarouselController,
                          onPageChanged: (index, _) =>
                              controller.onUpComingChange(index)),

                    ///   Running Tournament
                    if (controller.runningTournament.isNotEmpty)
                      tournamentView(
                          title: 'Running Tournament',
                          mainList: controller.runningTournament,
                          index: controller.runningIndex,
                          carouselController:
                              controller.runningCarouselController,
                          onPageChanged: (index, _) =>
                              controller.onRunningChange(index)),

                    ///   Completed Tournament
                    if (controller.completeTournament.isNotEmpty)
                      tournamentView(
                          title: 'Completed Tournament',
                          mainList: controller.completeTournament,
                          index: controller.completedIndex,
                          carouselController:
                              controller.completedCarouselController,
                          onPageChanged: (index, _) =>
                              controller.onCompletedChange(index)),

                    ///   Cancelled Tournament
                    if (controller.cancelTournament.isNotEmpty)
                      tournamentView(
                          title: 'Cancelled Tournament',
                          mainList: controller.cancelTournament,
                          index: controller.cancelIndex,
                          carouselController:
                              controller.cancelCarouselController,
                          onPageChanged: (index, _) =>
                              controller.onCancelChange(index)),

                    ///   Completed Tournament
                    if (controller.iplTournament.isNotEmpty)
                      tournamentView(
                          title: 'IPL Updates',
                          mainList: controller.iplTournament,
                          index: controller.iplIndex,
                          carouselController: controller.iplCarouselController,
                          onPageChanged: (index, _) =>
                              controller.onIplChange(index)),
                  ],
                ),
              ),
            ));
  }

  Widget tournamentView({
    required String title,
    required List<Widget> mainList,
    required int index,
    required CarouselController carouselController,
    Function(int, CarouselPageChangedReason)? onPageChanged,
  }) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 24, 18, 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
          ),
          CustomCarousel(
            boxHgt: Get.width * 0.5,
            boxWdt: double.infinity,
            itemList: mainList,
            index: index,
            carouselController: carouselController,
            onPageChanged: onPageChanged,
          ),
        ]);
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

//////////////////////
class ContainerItem extends StatelessWidget {
  final String imgName;
  final String label;

  const ContainerItem({super.key, required this.imgName, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      padding: const EdgeInsets.only(left: 22, right: 22, top: 6),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(247, 247, 247, 1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color.fromRGBO(0, 116, 56, 0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imgName),
            radius: 30,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(34, 34, 34, 1),
            ),
          )
        ],
      ),
    );
  }
}
