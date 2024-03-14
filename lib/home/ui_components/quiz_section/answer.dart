import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_utils/color_constants.dart';

class AnswerWgt extends StatelessWidget {
  final String txt;
  final bool isSelected;
  final VoidCallback onTapOption;

  const AnswerWgt({
    super.key,
    required this.txt,
    required this.isSelected,
    required this.onTapOption,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTapOption,
        child: Container(
          height: 35,
          width: Get.width * 0.4,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? ColorConstants().greenColor
                  : const Color.fromRGBO(0, 0, 0, 0.5),
            ),
            borderRadius: BorderRadius.circular(6),
            color: isSelected ? ColorConstants().greenColor : Colors.white,
          ),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                txt,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: isSelected
                      ? ColorConstants.whiteColor
                      : const Color.fromRGBO(0, 0, 0, 0.5),
                ),
              ),
              Container(
                width: 18,
                height: 18,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? ColorConstants.whiteColor : Colors.white70,
                  border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.5)),
                ),
                child: Icon(
                  Icons.done,
                  color: isSelected ? ColorConstants().greenColor : Colors.white,
                  size: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}