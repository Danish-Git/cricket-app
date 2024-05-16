import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api_methods/api_constants.dart';
import '../../../../../app_utils/helper.dart';
import '../../../../../models/match.dart';
import '../../../helper/widgets/batsman_score_board.dart';
import '../../../helper/widgets/bowlers_score_board.dart';
import '../../live_score_board.dart';
import 'controller.dart';

class LiveScoreboardTab extends StatelessWidget {
  const LiveScoreboardTab({
    super.key,
    this.match,
    this.isLiveMatch,
  });

  final MatchModel? match;
  final bool? isLiveMatch;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveScoreboardTabController>(
        global: false,
        init: LiveScoreboardTabController(match: match, isLiveMatch: isLiveMatch),
        dispose: (GetBuilderState<LiveScoreboardTabController> state) async => state.controller?.disposeStream(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                ///////  match score

                controller.isLoading
                    ? Helper.showLoader()
                    : LiveScoreBoard(scoreBoard: controller.scoreList),

                if(controller.isBatsmanDataLoading)...{
                  Helper.showLoader()
                } else ... {
                  BatsmanScoreBoard(
                    batsmanList: controller.batsmanList,
                    isLiveTab: false,
                  )
                },

                //////// EXTRA SCORE BLOCK

                Container(
                  height: 70,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'EXTRAS',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '14',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '(B 8, LB 1, NB 2, W6)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TOTAL',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.green,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${controller.totalRuns}/4',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${controller.overs?.over ?? '0'}.${controller.overs?.remainingBalls ?? '0'} OV (RR ${controller.runRate})',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                ////    fall of wicket

                Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.only(top: 24),
                  alignment: Alignment.center,
                  color: Colors.grey.shade300,
                  child: const Row(
                    children: [
                      Text(
                        'Fall of Wickets',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Runs',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const FallOfWicketItem(),
                const FallOfWicketItem(),
                const FallOfWicketItem(),

                //////    YET TO BAT

                Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  margin: const EdgeInsets.only(top: 24),
                  color: Colors.grey.shade300,
                  child: const Text(
                    'Yet to Bat',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),

                Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
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
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(helmet),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '    Batsmen Name',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              '    In at 7',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const YetToBatItem(),

                ///////////////////// BOWLER

                if(controller.isBowlersDataLoading)...{
                  Helper.showLoader()
                } else ...{
                  BowlersScoreBoard(bowlersList: controller.bowlersList),
                },
              ],
            ),
          );
        });
  }
}
