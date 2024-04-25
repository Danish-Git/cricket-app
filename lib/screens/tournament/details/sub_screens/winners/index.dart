import 'package:cricket/screens/tournament/details/widget/table_structure.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api_methods/api_constants.dart';
import '../../../../../app_utils/helper.dart';
import '../../../../../app_utils/table_bg_wgt.dart';
import '../../../../../routing_dir/app_screen_const.dart';
import '../../table_wgt.dart';
import 'controller.dart';

class WinnersScreen extends StatelessWidget {
  const WinnersScreen({
    super.key,
    required this.tournamentID,
  });

  final String? tournamentID;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WinnersScreenController>(
      global: false,
      init: WinnersScreenController(tournamentID: tournamentID),
      builder: (controller) {
        
        return Expanded(
          child: TableStructure(
            tableTitle: 'WINNER',
            tableBody: controller.isLoading
              ? Helper.showLoader()
              : GestureDetector(
                onTap: () => Get.toNamed(AppScreenConst.teamDetail),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.7),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Helper.showHelmetLogo(height: 60, width: 60),
                    const Text(
                      '   NEW ZEALAND*',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
