import 'package:cricket/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../app_utils/image_utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        global: false,
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              left: false,
              right: false,
              bottom: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: Get.width * 0.55,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SvgImgUtils(
                        imgName: 'assets/down_dot.svg',
                        wth: double.infinity,
                        hgt: Get.width,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 300,
                    height: 170,
                    child: SvgImgUtils(
                      imgName: 'assets/splash.svg',
                      wth: 200,
                      hgt: 200,
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: SizedBox(
                          width: double.infinity,
                          height: 280,
                          child: SvgPicture.asset(
                            'assets/up_dot.svg',
                            height: Get.width * 0.7,
                            // fit: BoxFit.cover,
                            semanticsLabel: ' Logo',
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 200,
                        left: 150,
                        child: Text(
                          'Version 1.0',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(0, 116, 56, 1),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 70,
                        left: 150,
                        child: SizedBox(
                          height: 41,
                          width: 41,
                          child: CircularProgressIndicator(
                            color: Color.fromRGBO(0, 116, 56, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
