import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class UIData {
  //routes
  static const String homeRoute = "/home";
  static const String addActivityPage = "/addActivityPage";
  static const String addResponsibilityPage = "/addResponsibilityPage";
  static const String notFoundRoute = "/No Search Result";
  static const String activityDetails = "/activityDetails";
  static const String responsibilityPage = "/responsibilityPage";
  static const String contactPage = "/contactPage";
  static const String joinOrganizationPage = "/joinOrganization";
  static const String loginPageRoute = "/login";
  static const String createOrgPage = "/createOrgPage";
  static const String switchOrgPage = "/switchOrgPage";
  static const String profilePage = "/profilePage";

  //strings
  static const String appName = "Talawa";

  //fonts
  static const String quickFont = "Quicksand";
  static const String ralewayFont = "Raleway";
  static const String quickBoldFont = "Quicksand_Bold.otf";
  static const String quickNormalFont = "Quicksand_Book.otf";
  static const String quickLightFont = "Quicksand_Light.otf";

  //images
  static const String imageDir = "assets/images";
  static const String pkImage = "$imageDir/pk.jpg";
  static const String profileImage = "$imageDir/profile.jpg";
  static const String blankImage = "$imageDir/blank.jpg";
  static const String dashboardImage = "$imageDir/dashboard.jpg";
  static const String loginImage = "$imageDir/login.jpg";
  static const String paymentImage = "$imageDir/payment.jpg";
  static const String settingsImage = "$imageDir/setting.jpeg";
  static const String shoppingImage = "$imageDir/shopping.jpeg";
  static const String timelineImage = "$imageDir/timeline.jpeg";
  static const String verifyImage = "$imageDir/verification.jpg";
  static const String splashScreen = "$imageDir/splashscreen.jpg";
  static const String talawaLogo = "$imageDir/talawaLogo-noBg.png";
  static const String cloud1 = "$imageDir/cloud1.jpg";
  static const String talawaLogoDark = "$imageDir/talawaLogo-dark.png";
  static const String quitoBackground = "$imageDir/quitoBackground.jpg";

  //gneric
  static const String coming_soon = "Coming Soon";

  static const MaterialColor ui_kit_color = Colors.grey;
  static const LightGrey = Color.fromRGBO(242, 242, 242, 1);

  // static const Color quitoThemeColor = MaterialColor(0xFF7e1946, {50:Color.fromRGBO(126,25,70, .1),
  //   100:Color.fromRGBO(126,25,70, .2),
  //   200:Color.fromRGBO(126,25,70, .3),
  //   300:Color.fromRGBO(126,25,70, .4),
  //   400:Color.fromRGBO(126,25,70, .5),
  //   500:Color.fromRGBO(126,25,70, .6),
  //   600:Color.fromRGBO(126,25,70, .7),
  //   700:Color.fromRGBO(126,25,70, .8),
  //   800:Color.fromRGBO(126,25,70, .9),
  //   900:Color.fromRGBO(126,25,70, 1)});
  static const Color primaryColor = Colors.orange;
  static const Color secondaryColor = Colors.blueAccent;

//colors
  static List<Color> kitGradients = [
    // new Color.fromRGBO(103, 218, 255, 1.0),
    // new Color.fromRGBO(3, 169, 244, 1.0),
    // new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.green.shade800,
    Colors.black87,
  ];
  static List<Color> kitGradients2 = [
    Colors.cyan.shade600,
    Colors.blue.shade900
  ];

  //randomcolor
  static final Random _random = new Random();

  /// Returns a random color.
  static Color next() {
    return new Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
  }
}
