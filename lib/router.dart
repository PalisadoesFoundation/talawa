import 'package:flutter/material.dart';
import 'package:talawa/main.dart';
import 'routing_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.DemoPageViewRoute:
      return MaterialPageRoute(
          builder: (context) => DemoPageView(
                key: Key("DemoPage"),
              ));

    default:
      return MaterialPageRoute(
          builder: (context) => DemoPageView(
                key: Key("DemoPage"),
              ));
  }
}
