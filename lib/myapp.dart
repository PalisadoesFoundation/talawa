import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quito/ui/page/home_page.dart';
import 'package:flutter_quito/ui/page/notfound/notfound_page.dart';
import 'package:flutter_quito/ui/page/login/login_page.dart';
import 'package:flutter_quito/utils/translations.dart';
import 'package:flutter_quito/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyApp extends StatelessWidget {
  static bool isLoggedIn = false;
  final materialApp = MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Color(0xffe78200),
          fontFamily: UIData.quickFont,
          primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: isLoggedIn ? HomePage() : LoginPage() ,
      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("hi", "IN"),
      ],
      // initialRoute: UIData.notFoundRoute,

      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(),
        // UIData.profileOneRoute: (BuildContext context) => ProfileOnePage(),
        // UIData.profileTwoRoute: (BuildContext context) => ProfileTwoPage(),
        // UIData.notFoundRoute: (BuildContext context) => NotFoundPage(),
        // UIData.dashboardOneRoute: (BuildContext context) => DashboardOnePage(),
        // UIData.dashboardTwoRoute: (BuildContext context) => DashboardTwoPage(),
        // UIData.projectDetails: (BuildContext context) => ProjectDetails()
      },
      onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
          builder: (context) => new NotFoundPage(
                appTitle: UIData.coming_soon,
                icon: FontAwesomeIcons.solidSmile,
                title: UIData.coming_soon,
                message: "Under Development",
                iconColor: Colors.green,
              )));

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
