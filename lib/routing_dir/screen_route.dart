import 'package:cricket/home/home_binding.dart';
import 'package:cricket/home/home_screen.dart';
import 'package:cricket/home/match_detail/match_detail_binding.dart';
import 'package:cricket/home/match_detail/match_detail_screen.dart';
import 'package:cricket/home/team_detail/team_detail_binding.dart';
import 'package:cricket/home/team_detail/team_detail_screen.dart';
import 'package:cricket/login/login_screen.dart';
import 'package:cricket/login/otp_screen.dart';
import 'package:cricket/payment_dir/payment_done_binding.dart';
import 'package:cricket/payment_dir/payment_done_screen.dart';
import 'package:cricket/payment_dir/payment_option/payment_option_binding.dart';
import 'package:cricket/payment_dir/payment_option/payment_option_screen.dart';
import 'package:cricket/splash/splash_binding.dart';
import 'package:cricket/user_profile/user_profile_binding.dart';
import 'package:cricket/user_profile/user_profile_screen.dart';
import 'package:cricket/welcome/welcome_binding.dart';
import 'package:cricket/welcome/welcome_screen.dart';
import 'package:get/get.dart';
import '../bottom_nav_dir/bottom_nav_screen.dart';
import '../login/login_binding.dart';
import '../registration_form_dir/registration_form_binding.dart';
import '../registration_form_dir/registration_form_screen.dart';
import '../splash/splash_screen.dart';
import 'app_screen_const.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppScreenConst.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppScreenConst.welcome,
      page: () => const WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppScreenConst.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppScreenConst.otpScreen,
      page: () => const OtpScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppScreenConst.bottomNav,
      page: () => const BottomNavScreen(),
    ),
    GetPage(
      name: AppScreenConst.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppScreenConst.matchDetail,
      page: () => const MatchDetailScreen(),
      binding: MatchDetailBinding(),
    ),
    GetPage(
      name: AppScreenConst.teamDetail,
      page: () => const TeamDetailScreen(),
      binding: TeamDetailBinding(),
    ),
    GetPage(
      name: AppScreenConst.userProfile,
      page: () => const UserProfileScreen(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: AppScreenConst.registrationFormScreen,
      page: () => const RegistrationFormScreen(),
      binding: RegistrationFormBinding(),
    ),
    ///////
    GetPage(
      name: AppScreenConst.paymentOption,
      page: () => const PaymentOptionScreen(),
      binding: PaymentOptionBinding(),
    ),
    GetPage(
      name: AppScreenConst.paymentDone,
      page: () => const PaymentDoneScreen(),
      binding: PaymentDoneBinding(),
    ),
  ];
}
