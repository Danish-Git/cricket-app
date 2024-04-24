import 'package:cricket/app_utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_utils/color_constants.dart';
import 'controller.dart';

class TournamentListing extends StatelessWidget {
  const TournamentListing({
    super.key,
    required this.gender,
    required this.type
  });

  final String gender;
  final String type;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TournamentListingController>(
      global: false,
      init: TournamentListingController(gender: gender, type: type),
      builder: (controller) {
        if(controller.isLoading) {
          return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Helper.showLoader()
                )
              ]
          );
        } else if(controller.tournamentList.isEmpty) {
          return Center(
              child: Helper.showError('No ${controller.type} Tournament Available')
          );
        } else {
          return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.tournamentList.length,
              padding: const EdgeInsets.all(10),
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  borderRadius:  BorderRadius.circular(15),
                  child: InkWell(
                    borderRadius:  BorderRadius.circular(15),
                    onTap: () => controller.onTapTournament(controller.tournamentList[index]),
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
                              controller.tournamentList[index].Banner ?? '',
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
                              stops: const [
                                0.1,
                                0.4,
                                0.6,
                                0.9,
                              ],
                              colors: [
                                ColorConstants().greenColor.withOpacity(0.0),
                                ColorConstants().greenColor.withOpacity(0.4),
                                ColorConstants().greenColor.withOpacity(0.6),
                                ColorConstants().greenColor.withOpacity(0.9),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.tournamentList[index].Tournament ?? '',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  setDate('Start Date : ', controller.tournamentList[index].StartDate ?? ''),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Age Group : ${controller.tournamentList[index].AgeGroup ?? ''}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    setDate('End Date : ', controller.tournamentList[index].EndDate ?? ''),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
          );
        }
      }
    );
  }

  Widget setDate(String title, String date) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Text(
          date,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

}
