import 'package:cricket/app_utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TableStructure extends StatelessWidget {
  const TableStructure({
    super.key,
    required this.tableTitle,
    this.tableHeader,
    this.tableBody
  });

  final String? tableTitle;
  final Widget? tableHeader;
  final Widget? tableBody;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/bg_table.svg',
          width: double.infinity,
          fit: BoxFit.fill,
          semanticsLabel: 'Logo',
        ),
        Center(child: Helper.showHelmetLogo()),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                  tableTitle ?? '',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )
              ),
            ),
            tableHeader ?? const SizedBox.shrink(),
            tableBody ?? const SizedBox.shrink(),
          ],
        )
      ],
    );
  }


}
