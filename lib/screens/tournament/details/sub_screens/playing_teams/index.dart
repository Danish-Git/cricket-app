import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app_utils/table_bg_wgt.dart';
import '../../../../../routing_dir/app_screen_const.dart';
import '../../table_wgt.dart';
import 'controller.dart';

class PlayingTeamsScreen extends StatelessWidget {
  const PlayingTeamsScreen({
    super.key,
    required this.tournamentID,
  });

  final String? tournamentID;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayingTeamsScreenController>(
      global: false,
      init: PlayingTeamsScreenController(tournamentID: tournamentID),
      builder: (controller) {
        return Stack(
          children: [
            const TableBackWgt(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TableTitle(label: 'PLAYING TEAMS'),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4, vertical: 12),
                  color: Colors.white.withOpacity(0.5),
                  child: Text('   No.of teams playing',
                      style: blackTxtStyle),
                ),
                Stack(
                  children: [
                    const OpacityHelmetImg(),
                    SizedBox(
                      height: Get.height * 0.42,
                      child: ListView.builder(
                          itemCount: controller.teamsList.length,
                          padding: EdgeInsets.zero,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(AppScreenConst.teamDetail);
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 0.7),
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6),
                                  child: Row(
                                    children: [
                                      Text(
                                          '         ${index + 1}        ',
                                          style: txtStyle),
                                      Image.network(
                                        controller.teamsList[index].teamLogo ?? '',
                                        width: 36,
                                        height: 28,
                                        fit: BoxFit.contain,
                                      ),
                                      Text(
                                          '     ${controller.teamsList[index].teamName?.toUpperCase()}',
                                          style: txtStyle),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
