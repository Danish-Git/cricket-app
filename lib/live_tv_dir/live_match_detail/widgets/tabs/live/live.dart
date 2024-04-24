import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../api_methods/api_constants.dart';
import '../../live_score_board.dart';
import 'controller.dart';

class LiveTab extends StatelessWidget {
  const LiveTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return GetBuilder<LiveTabController>(
      global: false,
      init: LiveTabController(),
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

              const LiveScoreBoard(),

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
                              label: controller.scoreList[index],
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

              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.center,
                color: Colors.grey.shade300,
                child: const Row(
                  children: [
                    Text(
                      'Batsman',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    CustomBox(label: 'R', isLabel: true),
                    CustomBox(label: 'B', isLabel: true),
                    CustomBox(label: '4s', isLabel: true),
                    CustomBox(label: '6s', isLabel: true),
                    CustomBox(label: 'SR', isLabel: true),
                  ],
                ),
              ),
              Container(
                height: 50,
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
                    Text(
                      '  Batsmen Name Long Text',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    CustomBox(label: '122', isLabel: false),
                    CustomBox(label: '111', isLabel: false),
                    CustomBox(label: '23', isLabel: false),
                    CustomBox(label: '23', isLabel: false),
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
                    Text(
                      '  Batsmen Name',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    CustomBox(label: '122', isLabel: false),
                    CustomBox(label: '111', isLabel: false),
                    CustomBox(label: '23', isLabel: false),
                    CustomBox(label: '23', isLabel: false),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Current Partnership   ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '76(42)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),

              //// bowler part
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.center,
                color: Colors.grey.shade300,
                child: const Row(
                  children: [
                    Text(
                      'Bowlers',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    CustomBox(label: 'O', isLabel: true),
                    CustomBox(label: 'M', isLabel: true),
                    CustomBox(label: 'R', isLabel: true),
                    CustomBox(label: 'W', isLabel: true),
                    CustomBox(label: 'ECO', isLabel: true),
                  ],
                ),
              ),
              Container(
                height: 50,
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
                    Text(
                      '  Bowler Name Long Text',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    CustomBox(label: '1', isLabel: false),
                    CustomBox(label: '2', isLabel: false),
                    CustomBox(label: '3', isLabel: false),
                    CustomBox(label: '1', isLabel: false),
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
                    Text(
                      '  Bowler Name',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    CustomBox(label: '1', isLabel: false),
                    CustomBox(label: '2', isLabel: false),
                    CustomBox(label: '3', isLabel: false),
                    CustomBox(label: '1', isLabel: false),
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
