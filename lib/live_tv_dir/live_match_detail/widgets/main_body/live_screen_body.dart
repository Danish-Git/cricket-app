import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_utils/app_static.dart';
import '../../../../app_utils/helper.dart';
import '../../../../app_utils/scaffold.dart';
import '../tabs/commentary/index.dart';
import '../tabs/live/live.dart';
import '../tabs/score_board/scoreboard.dart';
import 'controller.dart';

class LiveScreenBody extends StatelessWidget {
  const LiveScreenBody({
    super.key,
    required this.player,
    required this.isPlayerReady,
  });

  final Widget player;
  final bool isPlayerReady;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<LiveScreenBodyController>(
      global: false,
      init: LiveScreenBodyController(isPlayerReady : isPlayerReady),
      builder: (controller) {
        return CustomScaffold(
          setDefaultAppBar: true,
          isBackButtonEnable: true,
          titleText: AppStatic.userName.isEmpty
              ? 'Live Streaming'
              : '  ${AppStatic.userName}',
          userImg: AppStatic.userProfileImage,
          body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                controller.isLoading
                    ? Center(child: Helper.showLoader())
                    : Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: controller.isPlayerReady
                                ? player
                                : Helper.showLoader()
                        ),
                      ),
                      const Expanded(
                        child: Column(
                          children: [
                            TabBar(
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
                            Expanded(
                              child: TabBarView(
                                children: [
                                  //////  LIVE TAB VIEW
                                  LiveTab(),

                                  /* SECOND TAB STARTS HERE !!!!!!!!!!!    */
                                  ////////// SCOREBOARD
                                  LiveScoreboardTab(),

                                  /* THIRD TAB STARTS HERE !!!!!!!!!!!    */
                                  ////////// COMMENTARY

                                  LiveCommentaryScreen()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
  }
}