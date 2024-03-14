import 'package:cricket/live_tv_dir/wgt_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../app_utils/image_utils.dart';
import '../home/match_detail/table_wgt.dart';
import '../home/ui_components/notification_wgt/notification_utils.dart';
import 'live_tv_controller.dart';

class LiveTvScreen extends StatelessWidget {
  const LiveTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveTvScreenController>(
      init: LiveTvScreenController(),
      builder: (controller) => DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
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
                                    left: 16, right: 12, top: 20, bottom: 16),
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
                                        Icons.notifications_none,
                                        size: 32,
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //     left: 20,
                              //     right: 20,
                              //     bottom: 20,
                              //   ),
                              //   child: YoutubePlayerBuilder(
                              //     onExitFullScreen: () {
                              //       // controller.onFullScreenChange();
                              //     },
                              //     onEnterFullScreen: () {
                              //       // controller.onFullScreenChange();
                              //     },
                              //     player: YoutubePlayer(
                              //       controller:
                              //           controller.youtubePlayerController,
                              //       showVideoProgressIndicator: true,
                              //       progressIndicatorColor: Colors.blueAccent,
                              //     ),
                              //     builder: (context, player) => player,
                              //   ),
                              // ),

                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom: 20,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: YoutubePlayer(
                                    controller:
                                        controller.youtubePlayerController,
                                    showVideoProgressIndicator: true,
                                    progressIndicatorColor: Colors.blueAccent,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      if (!controller.isFullScreen)
                        Expanded(
                          child: Column(
                            children: [
                              const TabBar(
                                indicatorWeight: 4,
                                indicatorColor: Colors.green,
                                dividerColor: Colors.green,
                                unselectedLabelColor: Colors.grey,
                                labelColor: Colors.green,
                                tabs: [
                                  Tab(text: 'Live'),
                                  Tab(text: 'Scorecard'),
                                  Tab(text: 'Commentary'),
                                ],
                              ),
                              if (!controller.isFullScreen)
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      //////  LIVE TAB VIEW
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            ////// match title

                                            SizedBox(
                                              height: 60,
                                              width: double.maxFinite,
                                              child: ListTile(
                                                title: const Text(
                                                    'BANGLADESH TOUR OF INDIA'),
                                                subtitle: const Text(
                                                    '1ST ODI,AT HYDERABAD'),
                                                trailing: Container(
                                                  width: 65,
                                                  height: 30,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    color: Colors.red,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 10,
                                                        height: 4,
                                                        margin: const EdgeInsets
                                                            .only(right: 4),
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      const Text(
                                                        'LIVE',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 12, bottom: 16),
                                              child:
                                                  Divider(color: Colors.grey),
                                            ),

                                            ///////  match score

                                            const MatchScoreWgt(),

                                            ///////////////////
                                            Container(
                                              height: 100,
                                              width: double.maxFinite,
                                              margin: const EdgeInsets.only(
                                                  top: 20),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 20,
                                              ),
                                              color: Colors.grey.shade100,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Last 10 Balls',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 14),
                                                  Expanded(
                                                    child: ListView.builder(
                                                        itemCount: controller
                                                            .scoreList.length,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemBuilder:
                                                            (BuildContext ctx,
                                                                int index) {
                                                          return CustomBallBox(
                                                            label: controller
                                                                    .scoreList[
                                                                index],
                                                            ballScore: controller
                                                                            .scoreList[
                                                                        index] ==
                                                                    'W'
                                                                ? BallScore
                                                                    .wicket
                                                                : controller.scoreList[
                                                                            index] ==
                                                                        '4'
                                                                    ? BallScore
                                                                        .fourRun
                                                                    : controller.scoreList[index] ==
                                                                            '6'
                                                                        ? BallScore
                                                                            .sixRun
                                                                        : BallScore
                                                                            .normalRun,
                                                          );
                                                        }),
                                                  )
                                                ],
                                              ),
                                            ),

                                            Container(
                                              height: 50,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              alignment: Alignment.center,
                                              color: Colors.grey.shade300,
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    'Batsman',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  CustomBox(
                                                      label: 'R',
                                                      isLabel: true),
                                                  CustomBox(
                                                      label: 'B',
                                                      isLabel: true),
                                                  CustomBox(
                                                      label: '4s',
                                                      isLabel: true),
                                                  CustomBox(
                                                      label: '6s',
                                                      isLabel: true),
                                                  CustomBox(
                                                      label: 'SR',
                                                      isLabel: true),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  bottom: BorderSide(
                                                    width: 1.5,
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                              ),
                                              child: const Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 16,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    backgroundImage:
                                                        NetworkImage(helmet),
                                                  ),
                                                  Text(
                                                    '  Batsmen Name Long Text',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  CustomBox(
                                                      label: '122',
                                                      isLabel: false),
                                                  CustomBox(
                                                      label: '111',
                                                      isLabel: false),
                                                  CustomBox(
                                                      label: '23',
                                                      isLabel: false),
                                                  CustomBox(
                                                      label: '23',
                                                      isLabel: false),
                                                  CustomBox(
                                                    label: '444.4',
                                                    isLabel: false,
                                                    isLast: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  bottom: BorderSide(
                                                    width: 1.5,
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                              ),
                                              child: const Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 16,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    backgroundImage:
                                                        NetworkImage(helmet),
                                                  ),
                                                  Text(
                                                    '  Batsmen Name',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  CustomBox(
                                                      label: '122',
                                                      isLabel: false),
                                                  CustomBox(
                                                      label: '111',
                                                      isLabel: false),
                                                  CustomBox(
                                                      label: '23',
                                                      isLabel: false),
                                                  CustomBox(
                                                      label: '23',
                                                      isLabel: false),
                                                  CustomBox(
                                                    label: '444.4',
                                                    isLabel: false,
                                                    isLast: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 50,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Current Partnership   ',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Text(
                                                    '76(42)',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            //// bowler part
                                            Container(
                                              height: 50,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              alignment: Alignment.center,
                                              color: Colors.grey.shade300,
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    'Bowlers',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  CustomBox(
                                                      label: 'O',
                                                      isLabel: true),
                                                  CustomBox(
                                                      label: 'M',
                                                      isLabel: true),
                                                  CustomBox(
                                                      label: 'R',
                                                      isLabel: true),
                                                  CustomBox(
                                                      label: 'W',
                                                      isLabel: true),
                                                  CustomBox(
                                                      label: 'ECO',
                                                      isLabel: true),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  bottom: BorderSide(
                                                    width: 1.5,
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                              ),
                                              child: const Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 16,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    backgroundImage:
                                                        NetworkImage(helmet),
                                                  ),
                                                  Text(
                                                    '  Bowler Name Long Text',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  CustomBox(
                                                      label: '1',
                                                      isLabel: false),
                                                  CustomBox(
                                                      label: '2',
                                                      isLabel: false),
                                                  CustomBox(
                                                      label: '3',
                                                      isLabel: false),
                                                  CustomBox(
                                                      label: '1',
                                                      isLabel: false),
                                                  CustomBox(
                                                    label: '5.7',
                                                    isLabel: false,
                                                    isLast: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  bottom: BorderSide(
                                                    width: 1.5,
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                              ),
                                              child: const Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 16,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    backgroundImage:
                                                        NetworkImage(helmet),
                                                  ),
                                                  Text(
                                                    '  Bowler Name',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  CustomBox(
                                                      label: '1',
                                                      isLabel: false),
                                                  CustomBox(
                                                      label: '2',
                                                      isLabel: false),
                                                  CustomBox(
                                                      label: '3',
                                                      isLabel: false),
                                                  CustomBox(
                                                      label: '1',
                                                      isLabel: false),
                                                  CustomBox(
                                                    label: '5.7',
                                                    isLabel: false,
                                                    isLast: true,
                                                  ),
                                                ],
                                              ),
                                            ),

                                            ///////

                                            Container(
                                              width: 180,
                                              height: 50,
                                              margin: const EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(28),
                                                color: Colors.green,
                                              ),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.list_alt_sharp,
                                                    size: 26,
                                                    color: Colors.white70,
                                                  ),
                                                  Text(
                                                    '  Full Scorecard',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),

                                      ////////// SCOREBOARD
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 24),
                                            const MatchScoreWgt(),
                                            Container(
                                              height: 50,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              margin: const EdgeInsets.only(
                                                  top: 24),
                                              alignment: Alignment.center,
                                              color: Colors.grey.shade300,
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    'Batsman',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  CustomBox(
                                                      label: 'R',
                                                      isLabel: true),
                                                  CustomBox(
                                                      label: 'B',
                                                      isLabel: true),
                                                  CustomBox(
                                                      label: '4s',
                                                      isLabel: true),
                                                  CustomBox(
                                                      label: '6s',
                                                      isLabel: true),
                                                  CustomBox(
                                                      label: 'SR',
                                                      isLabel: true),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  bottom: BorderSide(
                                                    width: 1.5,
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const CircleAvatar(
                                                        radius: 16,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                helmet),
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.35,
                                                        child: const Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '    Batsmen Name',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(top: 4),
                                                              child: Text(
                                                                '    c Kohli b Bumrah',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  const CustomBox(
                                                      label: '122',
                                                      isLabel: false),
                                                  const CustomBox(
                                                      label: '111',
                                                      isLabel: false),
                                                  const CustomBox(
                                                      label: '23',
                                                      isLabel: false),
                                                  const CustomBox(
                                                      label: '23',
                                                      isLabel: false),
                                                  const CustomBox(
                                                    label: '444.4',
                                                    isLabel: false,
                                                    isLast: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  bottom: BorderSide(
                                                    width: 1.5,
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const CircleAvatar(
                                                        radius: 16,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                helmet),
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.35,
                                                        child: const Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '    Batsmen Name',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(top: 4),
                                                              child: Text(
                                                                '    c Kohli b Bumrah',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  const CustomBox(
                                                      label: '122',
                                                      isLabel: false),
                                                  const CustomBox(
                                                      label: '111',
                                                      isLabel: false),
                                                  const CustomBox(
                                                      label: '23',
                                                      isLabel: false),
                                                  const CustomBox(
                                                      label: '23',
                                                      isLabel: false),
                                                  const CustomBox(
                                                    label: '444.4',
                                                    isLabel: false,
                                                    isLast: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border(
                                                  bottom: BorderSide(
                                                    width: 1.5,
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const CircleAvatar(
                                                        radius: 16,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                helmet),
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.35,
                                                        child: const Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '    Batsmen Name',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(top: 4),
                                                              child: Text(
                                                                '    c Kohli b Bumrah',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  const CustomBox(
                                                      label: '122',
                                                      isLabel: false),
                                                  const CustomBox(
                                                      label: '111',
                                                      isLabel: false),
                                                  const CustomBox(
                                                      label: '23',
                                                      isLabel: false),
                                                  const CustomBox(
                                                      label: '23',
                                                      isLabel: false),
                                                  const CustomBox(
                                                    label: '444.4',
                                                    isLabel: false,
                                                    isLast: true,
                                                  ),
                                                ],
                                              ),
                                            ),

                                            //////// EXTRA SCORE BLOCK

                                            Container(
                                              height: 70,
                                              color: Colors.white,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'EXTRAS',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '14',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      Text(
                                                        '(B 8, LB 1, NB 2, W6)',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                            const Divider(),

                                            Container(
                                              height: 70,
                                              color: Colors.white,
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16),
                                              child: const Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    'TOTAL',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '233/4',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      Text(
                                                        '36.5 OV (RR 7.2)',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),



                                          ],
                                        ),
                                      ),

                                      ////////// commentary
                                      const Center(child: Icon(Icons.alarm))
                                    ],
                                  ),
                                ),
                            ],
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
