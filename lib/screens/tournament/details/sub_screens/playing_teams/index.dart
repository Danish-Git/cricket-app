import 'package:cricket/screens/tournament/details/widget/table_structure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        return Expanded(
          child: TableStructure(
            tableTitle: 'PLAYING TEAMS',
            tableBody: ListView.builder(
              itemCount: controller.teamsList.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => controller.navigateToDetailScreen(controller.teamsList[index]),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.7),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Text('         ${index + 1}        ', style: txtStyle),
                          Image.network(
                            controller.teamsList[index].teamLogo ?? '',
                            width: 36, height: 28, fit: BoxFit.contain,
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
        );
      },
    );
  }
}
