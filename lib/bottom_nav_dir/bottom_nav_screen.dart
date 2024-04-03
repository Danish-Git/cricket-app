import 'package:cricket/bottom_nav_dir/bottom_nav_controller.dart';
import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      global: false,
      init: BottomNavController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: controller.pages[controller.selectedNavigationItem],
          bottomNavigationBar: FancyBottomNavigation(
              initialSelection: 0,
              tabs: [
                TabData(iconData: Icons.home_outlined, title: 'Home'),
                TabData(iconData: Icons.live_tv_outlined, title: 'Live'),
                // TabData(iconData: Icons.shopping_cart_outlined, title: 'Cart'),
                TabData(iconData: CupertinoIcons.photo, title: 'Gallery'),
                TabData(iconData: Icons.person_3_rounded, title: 'Profile'),
              ],
              onTabChangedListener: (position) =>
                  controller.setBottomNavigationBarSelectedItem(position)),
        ),
      ),
    );
  }
}
