import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_utils/app_wgts_utils.dart';
import '../app_utils/color_constants.dart';
import '../app_utils/custom_button.dart';
import 'tournament_register_controller.dart';

class TournamentRegisterScreen extends StatelessWidget {
  const TournamentRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TournamentRegisterController>(
      init: TournamentRegisterController(),
      global: false,
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Registration',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: ColorConstants().greenColor,
            ),
          ),
          centerTitle: true,
          leading: const BackBtnIcon(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Registration for tournament',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants().blackColor,
                ),
              ),
              const SizedBox(height: 4),
              const Text.rich(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                TextSpan(
                  children: [
                    TextSpan(text: '    Enter your '),
                    TextSpan(
                      text: 'Details',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: ' below'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              CustomDropDown(
                label: 'Age',
                emptyVal: 'Select age',
                selectedVal: controller.selectedAge,
                list: controller.ageList,
                onTap: (String? val) {
                  controller.onAgeChange(val!);
                },
              ),
              CustomDropDown(
                label: 'Player title',
                emptyVal: '',
                selectedVal: controller.selectedPlayerType,
                list: controller.playerTypeList,
                onTap: (String? val) {
                  controller.onPlayerChange(val!);
                },
              ),
              CustomButton(
                label: 'Continue',
                wth: double.infinity,
                margin: const EdgeInsets.only(top: 32, left: 18, right: 18),
                hgt: 50,
                color: ColorConstants().greenColor,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  final String label;
  final String selectedVal;
  final String emptyVal;
  final List<String> list;
  final Function(String? val) onTap;

  const CustomDropDown({
    super.key,
    required this.label,
    required this.selectedVal,
    required this.emptyVal,
    required this.list,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 24, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(150, 150, 150, 1),
            ),
          ),
          DropdownButton(
            isExpanded: true,
            isDense: true,
            elevation: 0,
            iconSize: 32,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            value: selectedVal.isNotEmpty ? selectedVal : emptyVal,
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (String? val) {
              onTap(val);
            },
          )
        ],
      ),
    );
  }
}
