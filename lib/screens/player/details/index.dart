import 'package:cricket/app_utils/helper.dart';
import 'package:cricket/app_utils/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_utils/app_wgts_utils.dart';
import '../../../app_utils/color_constants.dart';
import '../../../app_utils/widgets/profile_image.dart';
import 'controller.dart';
import 'widgets/detail_item.dart';

class PlayerDetailScreen extends StatelessWidget {
  const PlayerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayerDetailScreenController>(
      init: PlayerDetailScreenController(),
      global: false,
      builder: (controller) => CustomScaffold(
        titleWidget: Text(
          controller.player?.playerName ?? 'Undefined',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: ColorConstants().greenColor,
          ),
        ),
        centerTitle: true,
        leadingWidget: const BackBtnIcon(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileImage(imageUrl: controller.player?.profilePicture, radius: 110,),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      controller.player?.playerName ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      controller.player?.playingAs ?? '',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(233, 243, 238, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Center(child: Helper.showHelmetLogo()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About Player',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 0, 0, 0.82),
                              ),
                            ),
                            SizedBox(height: 4),
                            DetailItem(label: 'Name', data: controller.player?.playerName),
                            DetailItem(label: 'Father name', data: controller.player?.fatherName),
                            DetailItem(label: 'Mother name', data: controller.player?.motherName),
                            DetailItem(label: 'DOB', data: controller.player?.dateOfBirth),
                            DetailItem(label: 'Highest score', data: controller.player?.highScore),
                            DetailItem(label: 'Wickets', data: controller.player?.wickets),
                            DetailItem(label: 'Fours', data: controller.player?.four),
                            DetailItem(label: 'Sixes', data: controller.player?.six),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(233, 243, 238, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact here',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(0, 0, 0, 0.82),
                          ),
                        ),
                        SizedBox(height: 4),
                        DetailItem(iconData: Icons.phone, data: '+91 1234567890'),
                        DetailItem(iconData: Icons.message, data: 'test@gmail.com'),
                        DetailItem(iconData: Icons.location_on_rounded, data: 'Street 2, house #05, Motarway'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
