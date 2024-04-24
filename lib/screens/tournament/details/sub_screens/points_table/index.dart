import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app_utils/table_bg_wgt.dart';
import '../../table_wgt.dart';
import 'controller.dart';

class PointsTableScreen extends StatelessWidget {
  const PointsTableScreen({
    super.key,
    required this.tournamentID,
  });

  final String? tournamentID;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PointsTableScreenController>(
      global: false,
      init: PointsTableScreenController(tournamentID: tournamentID),
      builder: (controller) {
        return Stack(
          children: [
            const TableBackWgt(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TableTitle(label: 'POINTS TABLE'),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4, vertical: 8),
                  color: Colors.white.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('    Teams', style: blackTxtStyle),
                      SizedBox(width: Get.width * 0.10),
                      Text('MP', style: blackTxtStyle),
                      Text('W', style: blackTxtStyle),
                      Text('L', style: blackTxtStyle),
                      Text('NR', style: blackTxtStyle),
                      Text('NRR', style: blackTxtStyle),
                      Text('  PTS', style: blackTxtStyle),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    const OpacityHelmetImg(),
                    SizedBox(
                      height: Get.height * 0.42,
                      child: ListView.builder(
                          itemCount: controller.pointTableList.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) {
                            var item = controller.pointTableList[index];

                            return PointTableItem(
                              index: index,
                              imgUrl: item.teamLogo ?? '',
                              countryName: item.teamName?.toUpperCase() ?? '',
                              matchPlayed: item.mp ?? '0',
                              winMatch: item.w ?? '0',
                              lossMatch: item.l ?? '0',
                              runRate: item.nr ?? '0',
                              netRunRate: item.nrr ?? '0',
                              pts: item.pts ?? '0',
                            );
                          }),
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
