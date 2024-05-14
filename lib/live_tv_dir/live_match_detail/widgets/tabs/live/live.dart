import 'package:cricket/app_utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../api_methods/api_constants.dart';
import '../../../../../models/match.dart';
import '../../Helper_Widget/custom_box.dart';
import '../../live_score_board.dart';
import 'controller.dart';
import 'widget/batsman_score_board.dart';
import 'widget/bowlers_score_board.dart';

class LiveTab extends StatelessWidget {
  const LiveTab({
    super.key,
    this.match,
    this.isLiveMatch,
  });

  final MatchModel? match;
  final bool? isLiveMatch;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<LiveTabController>(
      global: false,
      init: LiveTabController(match: match, isLiveMatch: isLiveMatch),
      dispose: (GetBuilderState<LiveTabController> state) => state.controller?.dispose(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ////// match title

              SizedBox(
                height: 60,
                width: double.maxFinite,
                child: ListTile(
                  title: const Text('BANGLADESH TOUR OF INDIA'),
                  subtitle: const Text('1ST ODI,AT HYDERABAD'),
                  trailing: Container(
                    width: 65,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 10,
                          height: 4,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'LIVE',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12, bottom: 16),
                child: Divider(color: Colors.grey),
              ),

              ///////  match score

              controller.isLoading
                ? Helper.showLoader()
                : LiveScoreBoard(scoreBoard: controller.scoreList),

              ///////////////////
              Container(
                height: 100,
                width: double.maxFinite,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                color: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Last 10 Balls',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller.scoreList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext ctx, int index) {
                            return CustomBallBox(
                              label: controller.overList[index],
                              ballScore: controller.scoreList[index] == 'W'
                                  ? BallScore.wicket
                                  : controller.scoreList[index] == '4'
                                  ? BallScore.fourRun
                                  : controller.scoreList[index] == '6'
                                  ? BallScore.sixRun
                                  : BallScore.normalRun,
                            );
                          }),
                    )
                  ],
                ),
              ),

              BatsmanScoreBoard(
                batsmanList: controller.batsmanList,
                totalRuns: controller.totalRuns.toString(),
                totalBalls: controller.totalBalls.toString(),
              ),

              //// bowler part
              BowlersScoreBoard(bowlersList: controller.bowlersList),

              ///////

              Container(
                width: 180,
                height: 50,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.green,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
