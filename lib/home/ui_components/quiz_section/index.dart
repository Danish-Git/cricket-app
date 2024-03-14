import 'package:cricket/home/home_controller.dart';
import 'package:flutter/material.dart';
import '../../../app_utils/color_constants.dart';
import 'answer.dart';

class QuizSection extends StatelessWidget {
  final HomeController controller;

  const QuizSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 165,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 1),
            spreadRadius: 0,
            blurRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Divider(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            thickness: 1,
          ),
          for (var question in controller.questionList)
            Column(
              children: [
                Center(
                  child: Text(
                    question.Question,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants().redColor,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.onSelectQuizAns(question.Option1);
                      },
                      child: AnswerWgt(
                        txt: question.Option1,
                        correctAns: controller.correctAns,
                        wrongAns: controller.wrongAns,
                        selectedVal: controller.selectedAns,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.onSelectQuizAns(question.Option2);
                      },
                      child: AnswerWgt(
                        txt: question.Option2,
                        correctAns: controller.correctAns,
                        wrongAns: controller.wrongAns,
                        selectedVal: controller.selectedAns,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.onSelectQuizAns(question.Option3);
                      },
                      child: AnswerWgt(
                        txt: question.Option3,
                        correctAns: controller.correctAns,
                        wrongAns: controller.wrongAns,
                        selectedVal: controller.selectedAns,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.onSelectQuizAns(question.Option4);
                      },
                      child: AnswerWgt(
                        txt: question.Option4,
                        correctAns: controller.correctAns,
                        wrongAns: controller.wrongAns,
                        selectedVal: controller.selectedAns,
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
