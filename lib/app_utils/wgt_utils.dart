import 'package:flutter/material.dart';

class RadioChip extends StatelessWidget {
  final bool isSelected;
  final String label;
  final VoidCallback onTap;

  const RadioChip({
    super.key,
    required this.isSelected,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 80,
        height: 20,
        margin: const EdgeInsets.only(left: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 1,
            color: isSelected
                ? const Color.fromRGBO(0, 116, 56, 1)
                : const Color.fromRGBO(0, 0, 0, 0.5),
          ),
          color:
              isSelected ? const Color.fromRGBO(0, 116, 56, 1) : Colors.white,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: isSelected
                ? const Color.fromRGBO(255, 255, 255, 1)
                : const Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ),
      ),
    );
  }
}
