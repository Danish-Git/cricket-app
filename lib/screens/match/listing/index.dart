import 'package:cricket/models/match.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_utils/color_constants.dart';
import '../../../app_utils/helper.dart';
import 'controller.dart';

class MatchListing extends StatelessWidget {
  const MatchListing({
    super.key,
    required this.tournamentID,
  });

  final String? tournamentID;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchListingController>(
      global: false,
      init: MatchListingController(tournamentID: tournamentID),
        builder: (controller) {
          if(controller.isLoading) {
            return Expanded(
              child: Center(
                child: Helper.showLoader()
              ),
            );
          } else if(controller.matchList.isEmpty) {
            return Expanded(
              child: Center(
                  child: Helper.showError('No Match Scheduled')
              ),
            );
          } else {
            return Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.matchList.length,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
                  itemBuilder: (BuildContext context, int index) {
                    return Material(
                      borderRadius:  BorderRadius.circular(15),
                      child: InkWell(
                        borderRadius:  BorderRadius.circular(15),
                        onTap: () => controller.onTapMatch(controller.matchList[index]),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: 180,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius:  BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius:  BorderRadius.circular(15),
                                child: Image.network(
                                  controller.matchList[index].banner ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                              decoration: BoxDecoration(
                                borderRadius:  BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: const [0.1, 0.4, 0.6, 0.9,],
                                  colors: [
                                    ColorConstants().greenColor.withOpacity(0.0),
                                    ColorConstants().greenColor.withOpacity(0.4),
                                    ColorConstants().greenColor.withOpacity(0.6),
                                    ColorConstants().greenColor.withOpacity(0.9),
                                  ],
                                ),
                              ),
                              child: matchDetails(controller.matchList[index]),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              ),
            );
          }
        }
    );
  }

  Widget matchDetails(MatchModel match) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(match.teamLogo1 ?? ''),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                match.teamName1 ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const Text(
          'VS',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(match.teamLogo2 ?? ''),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                match.teamName2 ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

}
