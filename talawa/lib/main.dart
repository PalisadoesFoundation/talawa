import 'package:flutter/material.dart';
import 'package:talawa/views/pages/_pages.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/add_responsibility_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: UIData.quitoThemeColor,
          fontFamily: UIData.quickFont,
          primarySwatch: UIData.quitoThemeColor),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,

      home: HomePage(),

      //routes
      routes: <String, WidgetBuilder>{
        UIData.homeRoute: (BuildContext context) => HomePage(),
        UIData.addActivityPage: (BuildContext context) => AddActivityPage(),
        UIData.addResponsibilityPage: (BuildContext context) =>
            AddResponsibilityPage(),
        UIData.activityDetails: (BuildContext context) => ActivityDetails(),
        UIData.notFoundRoute: (BuildContext context) => NotFoundPage(),
        UIData.responsibilityPage: (BuildContext context) =>
            ResponsibilityPage(),
        UIData.contactPage: (BuildContext context) => ContactPage()
      },
      onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
          builder: (context) => new NotFoundPage(
                appTitle: UIData.coming_soon,
                icon: FontAwesomeIcons.solidSmile,
                title: UIData.coming_soon,
                message: "Under Development",
                iconColor: Colors.green,
              )),
    );
  }
}
