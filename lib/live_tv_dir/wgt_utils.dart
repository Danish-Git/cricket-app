import 'package:flutter/material.dart';

import '../home/match_detail/table_wgt.dart';

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

class CustomBox extends StatelessWidget {
  final String label;
  final bool isLabel;
  final bool isLast;

  const CustomBox({
    super.key,
    required this.label,
    required this.isLabel,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isLast ? 32 : 36,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11,
          color: isLabel ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}