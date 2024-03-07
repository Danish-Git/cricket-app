import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TableBackWgt extends StatelessWidget {
  const TableBackWgt({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height * 0.53,
      child: SvgPicture.asset(
        'assets/bg_table.svg',
        width: double.infinity,
        fit: BoxFit.fill,
        semanticsLabel: 'Logo',
      ),
    );
  }
}

class TableTitle extends StatelessWidget {
  final String label;

  const TableTitle({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 12),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
