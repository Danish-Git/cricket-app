import 'package:cricket/app_utils/ad_banner/index.dart';
import 'package:cricket/app_utils/app_static.dart';
import 'package:cricket/app_utils/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_utils/color_constants.dart';
import '../app_utils/wgt_utils.dart';
import '../app_utils/widgets/gender_toggle.dart';
import 'home_controller.dart';
import 'ui_components/quiz_section/index.dart';
import 'ui_components/tournament_listing/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        global: false,
        init: HomeController(),
        builder: (controller) => CustomScaffold(
              setDefaultAppBar: true,
              titleText: AppStatic.userName.isEmpty
                  ? 'Cricket Club'
                  : '  ${AppStatic.userName}',
              userImg: AppStatic.userProfileImage,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AdsSlider(
                      // boxHgt: Get.width * 0.5,
                      // boxWdt: double.maxFinite,
                      // itemList: controller.completeTournament,
                      // index: controller.completedIndex,
                      // carouselController: controller.completedCarouselController,
                      // onPageChanged: (index, _) => controller.onCompletedChange(index),
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tournaments',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          GenderToggle(
                            selectedIndex: controller.selectedFilterStatus,
                            onToggle: controller.onGenderToggle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.tournamentStatusList.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return RadioChip(
                            isSelected: controller.tournamentStatusList[index].isSelected ?? false,
                            label: controller.tournamentStatusList[index].label ?? '',
                            onTap: () => controller.onTournamentStatusChange(controller.tournamentStatusList[index]),
                          );
                        }
                      ),
                    ),
                    TournamentListing(
                      key: UniqueKey(),
                      gender: controller.filterStatusList[controller.selectedFilterStatus].id ?? '',
                      type: controller.tournamentStatusList[controller.selectedTournamentStatus].id ?? ''
                    ),
                  ],
                ),
              ),
            ));
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
