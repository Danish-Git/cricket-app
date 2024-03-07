import 'package:cricket/app_utils/custom_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_utils/app_wgts_utils.dart';
import '../../app_utils/image_utils.dart';
import '../../app_utils/table_bg_wgt.dart';
import '../../app_utils/wgt_utils.dart';
import '../../routing_dir/app_screen_const.dart';
import 'match_detail_controller.dart';
import 'table_wgt.dart';

class MatchDetailScreen extends StatelessWidget {
  const MatchDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchDetailController>(
      init: MatchDetailController(),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: Get.width * 0.77,
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
                    children: [
                      const SizedBox(height: 20),
                      const CustomAppBar(label: 'UNDER 19', isGreen: false),
                      const SizedBox(height: 20),
                      CustomCarousel(
                        boxHgt: 200,
                        boxWdt: Get.width * 0.95,
                        itemList: controller.upComingTournament,
                        index: controller.upComingIndex,
                        carouselController:
                            controller.upComingCarouselController,
                        onPageChanged: (index, _) {
                          controller.onUpComingChange(index);
                        },
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    RadioChip(
                      isSelected: controller.currentSelectedIndex == 0,
                      label: 'Match',
                      onTap: () {
                        controller.onTapChip(0);
                      },
                    ),
                    RadioChip(
                        isSelected: controller.currentSelectedIndex == 1,
                        label: 'Point Table',
                        onTap: () {
                          controller.onTapChip(1);
                        }),
                    RadioChip(
                        isSelected: controller.currentSelectedIndex == 2,
                        label: 'Top Runner',
                        onTap: () {
                          controller.onTapChip(2);
                        }),
                    RadioChip(
                        isSelected: controller.currentSelectedIndex == 3,
                        label: 'Wickets',
                        onTap: () {
                          controller.onTapChip(3);
                        }),
                    RadioChip(
                        isSelected: controller.currentSelectedIndex == 4,
                        label: 'Winners',
                        onTap: () {
                          controller.onTapChip(4);
                        }),
                    RadioChip(
                        isSelected: controller.currentSelectedIndex == 5,
                        label: 'Playing\nTeams',
                        onTap: () {
                          controller.onTapChip(5);
                        }),
                    RadioChip(
                        isSelected: controller.currentSelectedIndex == 6,
                        label: 'Most 4*/6*',
                        onTap: () {
                          controller.onTapChip(6);
                        }),
                  ],
                ),
              ),
              if (controller.currentSelectedIndex == 0)
                const SizedBox(height: 24)
              else
                const Spacer(),

              /////////////  match
              if (controller.currentSelectedIndex == 0)
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.tournamentList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 160,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              controller.tournamentList[index].MatchBanner,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                ),

              //////////  points table
              if (controller.currentSelectedIndex == 1)
                Stack(
                  children: [
                    const TableBackWgt(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TableTitle(label: 'POINTS TABLE'),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 8),
                          color: Colors.white.withOpacity(0.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('    Teams', style: blackTxtStyle),
                              SizedBox(width: Get.width * 0.10),
                              Text('MP', style: blackTxtStyle),
                              Text('W', style: blackTxtStyle),
                              Text('L', style: blackTxtStyle),
                              Text('NR', style: blackTxtStyle),
                              Text('NRR', style: blackTxtStyle),
                              Text('  PTS', style: blackTxtStyle),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            const OpacityHelmetImg(),
                            SizedBox(
                              height: Get.height * 0.42,
                              child: ListView.builder(
                                  itemCount: controller.pointsTableData.length,
                                  padding: EdgeInsets.zero,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var item =
                                        controller.pointsTableData[index];

                                    return PointTableItem(
                                      index: index,
                                      imgUrl: item.TeamLogo,
                                      countryName: item.TeamName.toUpperCase(),
                                      matchPlayed: item.MP,
                                      winMatch: item.W,
                                      lossMatch: item.L,
                                      runRate: item.NR,
                                      netRunRate: item.NRR,
                                      pts: item.PTS,
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),

              // const SizedBox(height: 24),

              //////////  for top runner
              if (controller.currentSelectedIndex == 2)
                TopRunnerWkt(
                  label: 'TOP RUNNER',
                  txtLabel: 'Runs   ',
                  runWkt: 'Runs',
                  isRun: true,
                  runList: controller.topRunnerList,
                  wktList: controller.topWicketsList,
                ),

              // const SizedBox(height: 24),

              //////////  for top wickets
              ///////// in case wickets runs = '12    '
              if (controller.currentSelectedIndex == 3)
                TopRunnerWkt(
                  label: 'WICKETS',
                  txtLabel: 'Wickets',
                  runWkt: 'Wickets',
                  isRun: false,
                  runList: controller.topRunnerList,
                  wktList: controller.topWicketsList,
                ),

              // const SizedBox(height: 24),

              //////////  for winner
              if (controller.currentSelectedIndex == 4)
                Stack(
                  children: [
                    const OpacityHelmetImg(),
                    const TableBackWgt(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TableTitle(label: 'WINNER'),
                        GestureDetector(
                          onTap: () {
                            print('here');
                            Get.toNamed(AppScreenConst.teamDetail);
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 0.7),
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  helmet,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.contain,
                                ),
                                const Text(
                                  '   NEW ZEALAND*',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),

              //////////  playing teams
              if (controller.currentSelectedIndex == 5)
                Stack(
                  children: [
                    const TableBackWgt(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TableTitle(label: 'PLAYING TEAMS'),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 12),
                          color: Colors.white.withOpacity(0.5),
                          child: Text('   No.of teams playing',
                              style: blackTxtStyle),
                        ),
                        Stack(
                          children: [
                            const OpacityHelmetImg(),
                            SizedBox(
                              height: Get.height * 0.42,
                              child: ListView.builder(
                                  itemCount: controller.playingTeamList.length,
                                  padding: EdgeInsets.zero,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppScreenConst.teamDetail);
                                      },
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 0.7),
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          child: Row(
                                            children: [
                                              Text(
                                                  '         ${index + 1}        ',
                                                  style: txtStyle),
                                              Image.network(
                                                controller
                                                    .playingTeamList[index]
                                                    .TeamLogo,
                                                width: 36,
                                                height: 28,
                                                fit: BoxFit.contain,
                                              ),
                                              Text(
                                                  '     ${controller.playingTeamList[index].TeamName.toUpperCase()}',
                                                  style: txtStyle),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
