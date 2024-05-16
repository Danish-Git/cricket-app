import 'package:cricket/models/main_scores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api_methods/api_constants.dart';
import '../../../app_utils/app_static.dart';
import '../helper/widgets/custom_box.dart';

class LiveScoreBoard extends StatelessWidget {
  const LiveScoreBoard({
    super.key,
    this.scoreBoard
  });

final List<MainScoresModel>? scoreBoard;

  @override
  Widget build(BuildContext context) {

    MainScoresModel? team1Scores = scoreBoard?.isEmpty ?? true ? null : scoreBoard?.first;
    MainScoresModel? team2Scores = scoreBoard?.isEmpty ?? true ? null : scoreBoard?.last;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ////////// left side
            SizedBox(
              width: Get.width * 0.38,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${team1Scores?.runs ?? '0'}  / ',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        team1Scores?.pOut ?? '0',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${team1Scores?.overs ?? '0'} OVERS',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  CustomContainer(),
                ],
              ),
            ),
            ///////////
            const SizedBox(width: 50),
            /////////// right side
            SizedBox(
              width: Get.width * 0.38,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${team2Scores?.runs ?? '0'}  / ',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        team2Scores?.pOut ?? '0',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${team2Scores?.overs ?? '0'} OVERS',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  CustomContainer(),
                ],
              ),
            ),
          ],
        ),

        /////////////////////
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 16),
          child: Divider(color: Colors.grey),
        ),
        const Text(
          'BAN NEEDS 0 RUNS IN 0 OVERS',
          style: TextStyle(
            fontSize: 14,
            color: Colors.green,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 45,
      margin: const EdgeInsets.only(top: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.grey.shade300,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(helmet),
          ),
          Text(
            'BAN',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

enum BallScore { normalRun, wicket, fourRun, sixRun }

class CustomBallBox extends StatelessWidget {
  final String label;
  final BallScore ballScore;

  const CustomBallBox({
    super.key,
    required this.label,
    required this.ballScore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      margin: const EdgeInsets.only(right: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ballScore == BallScore.fourRun
            ? Colors.blue
            : ballScore == BallScore.wicket
                ? Colors.red
                : ballScore == BallScore.sixRun
                    ? Colors.green
                    : Colors.grey,
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class FallOfWicketItem extends StatelessWidget {
  const FallOfWicketItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
      child: Row(
        children: [
          SizedBox(
            width: Get.width * 0.35,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Batsmen Name',
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
                    '10.1 Over',
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
          ),
          const Spacer(),
          const CustomBox(
            label: '1-72',
            isLabel: false,
          ),
        ],
      ),
    );
  }
}

//////////

class YetToBatItem extends StatelessWidget {
  const YetToBatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
    );
  }
}

/*  WIDGETS FOR COMMENTARY PART */

class CommentaryItem extends StatelessWidget {
  const CommentaryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1.5,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              '7.5',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: const Text(
                'W',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        title: const Text(
          'Jadeja to Dale steyn , Wicket!',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            AppStatic.longTxt,
            maxLines: 7,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
