import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api_methods/api_constants.dart';
import '../../../../../app_utils/table_bg_wgt.dart';
import '../../widget/table_structure.dart';
import 'controller.dart';
import 'widget/top_player_item.dart';

class TopPlayerScreen extends StatelessWidget {
  const TopPlayerScreen({
    Key? key,
    this.tournamentID,
    this.label,
    this.txtLabel,
    this.runWkt,
    this.isRun,
  }) : super(key: key);

  final String? tournamentID;
  final String? label;
  final String? txtLabel;
  final String? runWkt;
  final bool? isRun;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopPlayerScreenController>(
      global: false,
      init: TopPlayerScreenController(tournamentID: tournamentID, isRun: isRun ?? false),
      builder: (controller) {
        return Expanded(
          child: TableStructure(
            tableTitle: label,
            tableHeader: Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
              color: Colors.white.withOpacity(0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('        Players', style: blackTxtStyle),
                  SizedBox(width: Get.width * 0.20),
                  Text('Team', style: blackTxtStyle),
                  const SizedBox(width: 12),
                  Text(txtLabel ?? '', style: blackTxtStyle),
                  Text('     Matches', style: blackTxtStyle),
                  Text('   Innings', style: blackTxtStyle),
                ],
              ),
            ),
            tableBody: ListView.builder(
                itemCount: controller.topPlayers.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return TopPlayerItem(
                    index: index,
                    imgUrl: controller.topPlayers[index].teamLogo,
                    playerName: controller.topPlayers[index].playerName,
                    runs: (controller.isRun) ? (controller.topPlayers[index].runs) : (controller.topPlayers[index].wicket),
                    matches: controller.topPlayers[index].match,
                    innings: controller.topPlayers[index].inning,
                  );
                }),
          ),
        );
      },
    );
  }

  final TextStyle blackTxtStyle = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  final TextStyle txtStyle = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  final TextStyle bigTxtStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
