import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String label;
  final bool isLabel;
  final bool isLast;

  const CustomBox({
    super.key,
    required this.label,
    required this.isLabel,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isLast ? 32 : 36,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11,
          color: isLabel ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}