import 'package:flutter/material.dart';
import 'package:talawa/main.dart';
import 'package:talawa/splash_screen.dart';
import 'package:talawa/views/Home%20Screen/home_view.dart';
import 'package:talawa/views/home_page.dart';
import 'package:talawa/views/pre_auth_screens/change_password.dart';
import 'package:talawa/views/pre_auth_screens/login.dart';
import 'package:talawa/views/pre_auth_screens/recover.dart';
import 'package:talawa/views/pre_auth_screens/select_language.dart';
import 'package:talawa/views/pre_auth_screens/set_url.dart';
import 'package:talawa/views/pre_auth_screens/signup_holder.dart';
import 'constants/routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return MaterialPageRoute(
          builder: (context) => const SplashScreen(key: Key('SplashScreen')));
    case Routes.languageSelectionRoute:
      return MaterialPageRoute(
          builder: (context) =>
              const SelectLanguage(key: Key('SelectLanguage')));
    case Routes.setUrlScreen:
      return MaterialPageRoute(
          builder: (context) => const SetUrl(key: Key('SetUrl')));
    case Routes.loginScreen:
      return MaterialPageRoute(
          builder: (context) => const Login(key: Key('Login')));
    case Routes.signupScreen:
      return MaterialPageRoute(
          builder: (context) => const Signup(key: Key('Signup')));
    case Routes.recoverScreen:
      return MaterialPageRoute(
          builder: (context) => const Recover(key: Key('Recover')));
    case Routes.updateScreen:
      return MaterialPageRoute(
          builder: (context) => const UpdatePassword(key: Key('Update')));
    case Routes.homeScreen:
      return MaterialPageRoute(
          builder: (context) => const HomeView(key: Key('HomeScreen')));
    case Routes.mainScreen:
      return MaterialPageRoute(
          builder: (context) => const MainScreen(key: Key('MainScreen')));

    default:
      return MaterialPageRoute(
          builder: (context) => const DemoPageView(
                key: Key("DemoPage"),
              ));
  }
}
