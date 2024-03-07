import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double wth;
  final double hgt;
  final Color color;
  final VoidCallback onTap;
  final EdgeInsets margin;

  const CustomButton({
    super.key,
    required this.label,
    required this.wth,
    required this.hgt,
    required this.color,
    required this.onTap,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: wth,
        height: hgt,
        margin: margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: color,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
