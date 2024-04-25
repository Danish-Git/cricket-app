import 'package:flutter/material.dart';

import '../../../../app_utils/color_constants.dart';

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    this.label,
    this.iconData,
    this.data
  });

  final String? label;
  final IconData? iconData;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          if(label?.isNotEmpty ?? false)...{
            Text(
              '$label  -',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),
          } else if(iconData != null)...{
            Icon(
              iconData,
              size: 18,
              color: ColorConstants().greenColor,
            ),
          },

          Text(
            '   ${data ?? ''}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(0, 116, 56, 1),
            ),
          ),
        ],
      ),
    );
  }
}