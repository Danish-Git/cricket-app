import 'package:cricket/app_utils/helper.dart';
import 'package:cricket/screens/team/details/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_utils/color_constants.dart';

class TeamHeader extends StatelessWidget {
  const TeamHeader({
    super.key,
    required this.controller,
  });

  final TeamDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Stack(
            children: [
              Helper.showNetworkImage(height: 170, width: double.maxFinite, url: controller.teamModel?.teamLogo ?? ''),
              Container(
                height: 170,
                width: double.maxFinite,
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.1, 0.4, 0.6, 0.9,],
                    colors: [
                      ColorConstants().greenColor.withOpacity(0.0),
                      ColorConstants().greenColor.withOpacity(0.4),
                      ColorConstants().greenColor.withOpacity(0.6),
                      ColorConstants().greenColor.withOpacity(0.9),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.teamModel?.teamName?.capitalize ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
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
          ),
        ),
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(controller.teamModel?.teamLogo ?? ''),
        ),
      ],
    );
  }
}
