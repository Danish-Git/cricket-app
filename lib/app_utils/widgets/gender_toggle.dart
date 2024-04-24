import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class GenderToggle extends StatelessWidget {
  const GenderToggle({
    super.key,
    required this.selectedIndex,
    required this.onToggle,
  });

  final int selectedIndex;
  final OnToggle onToggle;

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 90.0,
      initialLabelIndex: selectedIndex,
      cornerRadius: 20.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: const ['Male', 'Female'],
      icons: const [Icons.male_outlined, Icons.female_outlined],
      activeBgColors: const [[Colors.blue],[Colors.pink]],
      onToggle: onToggle,
    );
  }
}
