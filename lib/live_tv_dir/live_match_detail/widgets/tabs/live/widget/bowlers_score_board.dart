import 'package:cricket/app_utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../../../models/payer_scores.dart';
import '../../../Helper_Widget/custom_box.dart';

class BowlersScoreBoard extends StatelessWidget {
  const BowlersScoreBoard({
    super.key,
    required this.bowlersList,
  });

  final List<PayerScores> bowlersList;

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

        ...bowlersList.map<Widget>((bowler) => Container(
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
                bowler.playerName ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              CustomBox(label: bowler.o ?? '', isLabel: false),
              CustomBox(label: bowler.m ?? '', isLabel: false),
              CustomBox(label: bowler.r ?? '', isLabel: false),
              CustomBox(label: bowler.w ?? '', isLabel: false),
              CustomBox(label: bowler.eco ?? '', isLabel: false, isLast: true,),
            ],
          ),
        )).toList(),
      ],
    );
  }
}
