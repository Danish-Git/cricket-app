import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImgUtils extends StatelessWidget {
  final String imgName;
  final double wth;
  final double hgt;

  const SvgImgUtils({
    super.key,
    required this.imgName,
    required this.wth,
    required this.hgt,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imgName,
      width: wth,
      height: hgt,
      fit: BoxFit.cover,
      semanticsLabel: '$imgName Logo',
    );
  }
}
