import 'package:cricket/home/home_screen.dart';
import 'package:cricket/screens/team/details/index.dart';
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
import '../login/login_binding.dart';
import '../registration_form_dir/registration_form_binding.dart';
import '../registration_form_dir/registration_form_screen.dart';
import '../screens/bottom_nav_dir/index.dart';
import '../screens/player/details/index.dart';
import '../screens/tournament/details/index.dart';
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
    ),
    GetPage(
      name: AppScreenConst.tournamentDetail,
      page: () => const TournamentDetailScreen(),
    ),
    // GetPage(
    //   name: AppScreenConst.matchDetail,
    //   page: () => const MatchDetailScreen(),
    // ),
    GetPage(
      name: AppScreenConst.teamDetail,
      page: () => const TeamDetailScreen(),
    ),
    GetPage(
      name: AppScreenConst.playerDetail,
      page: () => const PlayerDetailScreen(),
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
