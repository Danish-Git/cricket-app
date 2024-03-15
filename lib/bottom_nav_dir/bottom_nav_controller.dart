import 'package:cricket/live_tv_dir/live_tv_screen.dart';
import 'package:cricket/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_screen.dart';

class BottomNavController extends GetxController {
  int selectedNavigationItem = 0;

  List pages = [
    const HomeScreen(),
    const LiveTvScreen(),
    const SizedBox(),
    const UserProfileScreen(),
  ];

  void setBottomNavigationBarSelectedItem(int position) {
    selectedNavigationItem = position;
    update();
  }
}
