import 'package:get/get.dart';
import 'package:tt_clone/features/account_setup/screens/profile_setting_screen.dart';
import 'package:tt_clone/features/auth/screen/registration_screen.dart';
import 'package:tt_clone/features/auth/screen/reset_password_screen.dart';
import 'package:tt_clone/features/home/screens/navbar.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";
  static String resetPasswordScreen = "/resetPasswordScreen";
  static String profileSetupScreen = "/profileSetupScreen";
  static String navBar = "/navBar";

  static String getLoginScreen() => loginScreen;

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => RegistrationScreen()),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
    GetPage(name: profileSetupScreen, page: () => ProfileSettingScreen()),
    GetPage(name: navBar, page: () => NavBar()),
  ];
}
