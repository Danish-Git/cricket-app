import 'package:cricket/app_utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../../../models/payer_scores.dart';
import '../../../Helper_Widget/custom_box.dart';

class BatsmanScoreBoard extends StatelessWidget {
  const BatsmanScoreBoard({
    super.key, 
    required this.batsmanList,
    this.totalRuns,
    this.totalBalls
  });

  final List<PayerScores> batsmanList;
  final String? totalRuns;
  final String? totalBalls;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        ...batsmanList.map<Widget>((batsman) => Container(
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
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.transparent,
                child: Helper.showHelmetLogo(),
              ),
              Text(
                batsman.playerName ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              CustomBox(label: batsman.r ?? '', isLabel: false),
              CustomBox(label: batsman.b ?? '', isLabel: false),
              CustomBox(label: batsman.fours ?? '', isLabel: false),
              CustomBox(label: batsman.six ?? '', isLabel: false),
              CustomBox(label: batsman.sr ?? '', isLabel: false, isLast: true),
            ],
          ),
        )).toList(),
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Current Partnership   ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              Text(
                '${totalRuns ?? '0'}(${totalBalls ?? '0'})',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
