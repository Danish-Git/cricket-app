import 'package:cricket/app_utils/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../api_methods/api_constants.dart';
import '../../../app_utils/app_wgts_utils.dart';
import '../../../app_utils/color_constants.dart';
import '../../../app_utils/custom_button.dart';
import '../../../app_utils/image_utils.dart';
import '../../../tournament_register_dir/tournament_register_screen.dart';
import 'controller.dart';
import 'widgets/player_item.dart';
import 'widgets/team_dress.dart';
import 'widgets/team_header.dart';

class TeamDetailScreen extends StatelessWidget {
  const TeamDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamDetailController>(
      init: TeamDetailController(),
      builder: (controller) {
        return SafeArea(
          child: CustomScaffold(
            titleWidget: Text(
              controller.teamModel?.teamName ?? 'Undefined',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorConstants().greenColor,
              ),
            ),
            centerTitle: true,
            leadingWidget: const BackBtnIcon(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TeamHeader(controller: controller),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TeamDress(teamDressUrl: controller.teamModel?.teamDress),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                'Team players details',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Wrap(
                                  runSpacing: 12,
                                  spacing: 25,
                                  children: controller.playerList.map(
                                    (player) => PlayerItem(player: player)
                                  ).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // floatingActionButton: CustomButton(
            //   label: 'Register in tournament',
            //   wth: Get.width * 0.9,
            //   hgt: 50,
            //   color: ColorConstants().greenColor,
            //   onTap: () {
            //     Get.to(() => const TournamentRegisterScreen());
            //   },
            // ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          ),
        );
      },
    );
  }
}
