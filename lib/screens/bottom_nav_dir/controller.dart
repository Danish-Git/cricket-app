import 'package:get/get.dart';
import '../../app_utils/app_static.dart';
import '../../app_utils/shared_pref_utils.dart';
import '../../gallery/index.dart';
import '../../home/home_screen.dart';
import '../../live_tv_dir/live_dir/live_screen.dart';
import '../../user_profile/UserProfileRepo.dart';
import '../../user_profile/user_profile_response.dart';
import '../../user_profile/user_profile_screen.dart';

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

  @override
  void onInit() {
    super.onInit();
    getUserDetail();
  }

  void getUserDetail() {
    UserProfileRepo().getUserProfile().then((value) async {
      if (value.status) {
        UserProfileResponse response = UserProfileResponse.fromJson(value.data);
        String userName = response.data[0].UserName;
        String userImg = response.data[0].ProfilePicture;
        String email = response.data[0].Email;

        SharedPreferencesService prefs = await SharedPreferencesService.getInstance();

        prefs.setString('userName', userName);
        prefs.setString('userProfileImage', userImg);
        prefs.setString('userEmail', email);

        AppStatic.userName = userName;
        AppStatic.userProfileImage = userImg;
        AppStatic.userEmail = email;

      }
    }).whenComplete(() {
      Future.delayed(const Duration(microseconds: 400), () {
        update();
      });
    });
  }

}
