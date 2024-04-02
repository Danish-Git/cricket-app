import 'package:get/get.dart';
import '../gallery/index.dart';
import '../home/home_screen.dart';
import '../live_tv_dir/live_dir/live_screen.dart';
import '../user_profile/user_profile_screen.dart';

class BottomNavController extends GetxController {
  int selectedNavigationItem = 0;

  List pages = [
    const HomeScreen(),
    const LiveScreen(),
    const GalleryScreen(),
    const UserProfileScreen(),
  ];

  void setBottomNavigationBarSelectedItem(int position) {
    selectedNavigationItem = position;
    update();
  }
}
