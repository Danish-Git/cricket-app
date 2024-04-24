import 'package:cricket/app_utils/ad_banner/index.dart';
import 'package:cricket/app_utils/scaffold.dart';
import 'package:cricket/screens/match/listing/index.dart';
import 'package:cricket/screens/tournament/details/sub_screens/playing_teams/index.dart';
import 'package:cricket/screens/tournament/details/sub_screens/winners/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app_utils/app_wgts_utils.dart';
import '../../../app_utils/color_constants.dart';
import '../../../app_utils/wgt_utils.dart';
import 'controller.dart';
import 'sub_screens/points_table/index.dart';
import 'sub_screens/top_player/index.dart';

class TournamentDetailScreen extends StatelessWidget {
  const TournamentDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TournamentDetailController>(
      global: false,
      init: TournamentDetailController(),
      builder: (controller) => CustomScaffold(
        titleWidget: Text(
          controller.tournament?.Tournament ?? 'Undefined',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorConstants().greenColor,
          ),
        ),
        centerTitle: true,
        leadingWidget: BackBtnIcon(onPressed: () => Get.back()),
        body: SafeArea(
          child: Column(
            children: [
              const AdsSlider(),

              Container(
                height: 40,
                margin: const EdgeInsets.only(bottom: 10),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.detailPageList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return RadioChip(
                        isSelected: controller.detailPageList[index].isSelected ?? false,
                        label: controller.detailPageList[index].label ?? '',
                        onTap: () => controller.onDetailPageChange(controller.detailPageList[index]),
                      );
                    }
                ),
              ),
              // if (controller.currentSelectedIndex == 0)
              //   const SizedBox(height: 24)
              // else
              //   const Spacer(),

              /////////////  match
              if (controller.selectedDetailPages == 0)
                MatchListing(tournamentID: controller.tournament?.TournamentID),

              //////////  points table
              if (controller.selectedDetailPages == 1)
                PointsTableScreen(tournamentID: controller.tournament?.TournamentID),

              // const SizedBox(height: 24),

              //////////  for top runner
              if (controller.selectedDetailPages == 2 || controller.selectedDetailPages == 3)
                TopPlayerScreen(
                  key: UniqueKey(),
                  tournamentID: controller.tournament?.TournamentID,
                  label: controller.selectedDetailPages == 2 ? 'TOP RUNNER' : 'WICKETS',
                  txtLabel: controller.selectedDetailPages == 2 ? 'Runs   ' : 'Wickets',
                  runWkt: controller.selectedDetailPages == 2 ? 'Runs' : 'Wickets',
                  isRun: controller.selectedDetailPages == 2,
                ),

              // const SizedBox(height: 24),

              // const SizedBox(height: 24),

              //////////  for winner
              if (controller.selectedDetailPages == 4)
                WinnersScreen(tournamentID: controller.tournament?.TournamentID),

              //////////  playing teams
              if (controller.selectedDetailPages == 5)
                PlayingTeamsScreen(tournamentID: controller.tournament?.TournamentID),
            ],
          ),
        ),
      ),
    );
  }
}
