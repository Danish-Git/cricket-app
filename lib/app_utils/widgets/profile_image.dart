import 'package:flutter/material.dart';

import '../color_constants.dart';
import '../helper.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    this.imageUrl,
    this.radius = 50,
  });

  final String? imageUrl;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    if(imageUrl?.isEmpty ?? true) {
      return Container(
        height: radius ?? 0 * 2,
        width: radius ?? 0 * 2,
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        decoration: BoxDecoration(
        shape: BoxShape.circle,
          border: Border.all(width: 1, color: ColorConstants().greenColor)
        ),
        child: Helper.showHelmetLogo(height: 100, width: 100),
      );
    } else {
      return CircleAvatar(
        radius: radius ?? 50,
        backgroundImage: NetworkImage(imageUrl ?? ''),
      );
    }
  }
}
