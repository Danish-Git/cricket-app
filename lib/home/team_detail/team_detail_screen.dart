import 'package:cricket/home/match_detail/table_wgt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_utils/app_wgts_utils.dart';
import '../../app_utils/image_utils.dart';
import 'team_detail_controller.dart';

class TeamDetailScreen extends StatelessWidget {
  const TeamDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamDetailController>(
      init: TeamDetailController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: Get.width * 0.77,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SvgImgUtils(
                          imgName: 'assets/down_dot.svg',
                          wth: double.infinity,
                          hgt: Get.width,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const CustomAppBar(
                              label: 'Team Detail', isGreen: false),
                          const SizedBox(height: 70),
                          Stack(
                            children: [
                              Container(
                                height: 170,
                                width: double.maxFinite,
                                padding: const EdgeInsets.only(left: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromRGBO(0, 116, 56, 1),
                                      Color.fromRGBO(0, 0, 0, 0),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                      helmet,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'INDIA',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'ICC Men’s ODI Cricket World Cup 2023',
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Positioned(
                      left: 0,
                      right: 0,
                      top: 55,
                      child: CircleAvatar(
                          radius: 50, backgroundImage: NetworkImage(helmet)),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: Text(
                    'Team players details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                      bottom: 18,
                      left: 20,
                      right: 20,
                    ),
                    child: Wrap(
                      runSpacing: 12,
                      spacing: 20,
                      children: controller.playerList
                          .map(
                            (i) => const PlayerItem(),
                          )
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class PlayerItem extends StatelessWidget {
  const PlayerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 98,
          width: 98,
          margin: const EdgeInsets.only(top: 8, bottom: 8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueAccent,
            image: DecorationImage(
              image: NetworkImage(helmet),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Text(
          'SHIKHAR',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: const Color.fromRGBO(232, 31, 66, 0.1),
          ),
          child: const Text(
            'Bowler',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(232, 31, 66, 1),
            ),
          ),
        ),
      ],
    );
  }
}
