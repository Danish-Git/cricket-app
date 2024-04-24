import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../app_utils/app_wgts_utils.dart';
import '../app_utils/color_constants.dart';
import '../screens/tournament/details/table_wgt.dart';
import 'player_profile_controller.dart';

class PlayerProfileScreen extends StatelessWidget {
  const PlayerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayerProfileController>(
      init: PlayerProfileController(),
      global: false,
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 290,
                      child: SvgPicture.asset(
                        'assets/down_dot.svg',
                        height: 290,
                        fit: BoxFit.cover,
                        semanticsLabel: 'Logo',
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: Get.width * 0.3,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage(
                              'https://plus.unsplash.com/premium_photo-1669324357471-e33e71e3f3d8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 22, top: 6),
                            child: Text(
                              'Tester Test',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            'Bowler',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12, top: 6),
                      child:
                          CustomAppBar(label: 'Player Detail', isGreen: false),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding:
                          const EdgeInsets.only(left: 20, top: 16, bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(233, 243, 238, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Stack(
                        children: [
                          OpacityHelmetImg(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About Player',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(0, 0, 0, 0.82),
                                ),
                              ),
                              SizedBox(height: 14),
                              TxtWgt(label: 'Name', data: 'Rajesh Kunwar'),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: TxtWgt(
                                    label: 'Father name',
                                    data: 'Testing Account'),
                              ),
                              TxtWgt(label: 'Mother name', data: 'Tester Test'),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: TxtWgt(label: 'Age', data: '24'),
                              ),
                              TxtWgt(label: 'Highest score', data: '17765'),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: TxtWgt(label: 'Wickets', data: '123'),
                              ),
                              TxtWgt(label: 'Fours', data: '77'),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: TxtWgt(label: 'Sixes', data: '46'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 24),
                      padding:
                          const EdgeInsets.only(left: 20, top: 14, bottom: 12),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(233, 243, 238, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact here',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(0, 0, 0, 0.82),
                            ),
                          ),
                          SizedBox(height: 16),
                          IconTxtWgt(
                              iconData: Icons.phone, data: '+91 1234567890'),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: IconTxtWgt(
                                iconData: Icons.message,
                                data: 'test@gmail.com'),
                          ),
                          IconTxtWgt(
                              iconData: Icons.location_on_rounded,
                              data: 'Street 2, house #05, Motarway'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TxtWgt extends StatelessWidget {
  final String label;
  final String data;

  const TxtWgt({super.key, required this.label, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$label  -   ',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
        ),
        Text(
          data,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(0, 116, 56, 1),
          ),
        ),
      ],
    );
  }
}

class IconTxtWgt extends StatelessWidget {
  final IconData iconData;
  final String data;

  const IconTxtWgt({super.key, required this.iconData, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 18,
          color: ColorConstants().greenColor,
        ),
        Expanded(
          child: Text(
            '      $data',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
        ),
      ],
    );
  }
}
