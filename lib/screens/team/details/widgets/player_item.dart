import 'package:cricket/app_utils/helper.dart';
import 'package:cricket/models/player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app_utils/color_constants.dart';
import '../../../../app_utils/constants/navigation_params.dart';
import '../../../../routing_dir/app_screen_const.dart';

class PlayerItem extends StatelessWidget {
  const PlayerItem({
    super.key,
    required this.player
  });

  final PlayerModel player;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => Get.toNamed(AppScreenConst.playerDetail, arguments: {NavParamsConstants.player: player}),
        child: Column(
          children: [
            if(player.profilePicture?.isEmpty ?? true)...{
              Container(
                height: 98,
                width: 98,
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: ColorConstants().greenColor)
                ),
                child: Helper.showHelmetLogo(height: 100, width: 100),
              ),
            } else...{
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(player.profilePicture ?? ''),
              ),
            },
            Text(
              player.playerName ?? '',
              style: const TextStyle(
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
              child: Text(
                player.playingAs ?? '',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(232, 31, 66, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}