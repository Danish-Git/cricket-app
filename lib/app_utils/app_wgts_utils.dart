import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_constants.dart';

class BackBtnIcon extends StatelessWidget {
  const BackBtnIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        size: 26,
        color: ColorConstants().greenColor,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String label;
  final bool isGreen;

  const CustomAppBar({super.key, required this.label, required this.isGreen});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BackBtnIcon(),
        SizedBox(width: Get.width * 0.23),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isGreen
                ? ColorConstants().greenColor
                : ColorConstants().blackColor,
          ),
        ),
      ],
    );
  }
}

class LabelTxtController extends StatelessWidget {
  final String label;
  final bool isReadOnly;
  final TextEditingController textEditingController;

  const LabelTxtController({
    super.key,
    required this.label,
    this.isReadOnly = false,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextField(
        controller: textEditingController,
        readOnly: isReadOnly,
        maxLength: 40,
        style: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 4),
          counterText: '',
          label: Text(label),
          labelStyle: const TextStyle(
            color: Color.fromRGBO(150, 150, 150, 1),
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(150, 150, 150, 1),
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(150, 150, 150, 1),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(150, 150, 150, 1),
            ),
          ),
        ),
      ),
    );
  }
}
