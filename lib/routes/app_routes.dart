import 'package:get/get.dart';
import 'package:tt_clone/features/auth/screen/registration_screen.dart';
import 'package:tt_clone/features/auth/screen/reset_password_screen.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";
  static String resetPasswordScreen = "/resetPasswordScreen";

  static String getLoginScreen() => loginScreen;

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => RegistrationScreen()),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
  ];
}
