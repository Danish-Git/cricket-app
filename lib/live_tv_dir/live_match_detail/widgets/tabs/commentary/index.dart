import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../live_score_board.dart';
import 'controller.dart';

class LiveCommentaryScreen extends StatelessWidget {
  const LiveCommentaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LiveCommentaryScreenController>(
      global: false,
      init: LiveCommentaryScreenController(),
      builder: (controller) {
        return Column(
          children: [
            const SizedBox(height: 24),
            const LiveScoreBoard(),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding:
              const EdgeInsets.symmetric(
                  horizontal: 12),
              margin: const EdgeInsets.only(
                  top: 24),
              color: Colors.grey.shade300,
              child: const Text(
                'Commentary',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder:
                    (BuildContext ctx,
                    int index) {
                  return const CommentaryItem();
                },
              ),
            )
          ],
        );
      });
  }
}
