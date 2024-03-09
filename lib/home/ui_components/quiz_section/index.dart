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
      height: 150,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
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
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var question in controller.questionList ) Column(
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
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnswerWgt(
                    txt: question.Option1,
                    isSelected: controller.selectedAns == 1,
                    onTapOption: () => controller.setQuizAnswer(1, question),
                  ),
                  AnswerWgt(
                    txt: question.Option2,
                    isSelected: controller.selectedAns == 2,
                    onTapOption: () => controller.setQuizAnswer(2, question),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnswerWgt(
                    txt: question.Option3,
                    isSelected: controller.selectedAns == 3,
                    onTapOption: () => controller.setQuizAnswer(3, question),
                  ),
                  AnswerWgt(
                    txt: question.Option4,
                    isSelected: controller.selectedAns == 4,
                    onTapOption: () => controller.setQuizAnswer(4, question),
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
