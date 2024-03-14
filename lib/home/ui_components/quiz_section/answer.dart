import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_utils/color_constants.dart';

class AnswerWgt extends StatelessWidget {
  final String txt;
  final String correctAns;
  final String wrongAns;
  final String selectedVal;

  const AnswerWgt({
    super.key,
    required this.txt,
    required this.correctAns,
    required this.wrongAns,
    required this.selectedVal,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: 35,
        width: Get.width * 0.4,
        decoration: BoxDecoration(
          border: Border.all(
            color: correctAns == txt
                ? ColorConstants().greenColor
                : selectedVal == txt && selectedVal != correctAns
                    ? const Color.fromRGBO(250, 57, 57, 1)
                    : const Color.fromRGBO(0, 0, 0, 0.5),
          ),
          borderRadius: BorderRadius.circular(6),
          color: correctAns == txt ? ColorConstants().greenColor : Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              txt,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: correctAns == txt
                    ? Colors.white
                    : selectedVal == txt && selectedVal != correctAns
                        ? const Color.fromRGBO(250, 57, 57, 1)
                        : const Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),
            Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: correctAns == txt
                    ? Colors.white
                    : selectedVal == txt && selectedVal != correctAns
                        ? const Color.fromRGBO(250, 57, 57, 1)
                        : const Color.fromRGBO(0, 0, 0, 0),
                border: Border.all(
                  color: correctAns == txt
                      ? Colors.white
                      : selectedVal == txt && selectedVal != correctAns
                          ? const Color.fromRGBO(250, 57, 57, 1)
                          : const Color.fromRGBO(0, 0, 0, 0.5),
                ),
              ),
              child: Icon(
                correctAns == txt
                    ? Icons.done
                    : selectedVal == txt && selectedVal != correctAns
                        ? Icons.highlight_remove
                        : Icons.done,
                color: correctAns == txt
                    ? ColorConstants().greenColor
                    : Colors.white,
                size: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
