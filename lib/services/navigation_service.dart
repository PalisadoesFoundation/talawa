import 'package:flutter/cupertino.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void fromInviteLink(List<String> routeNames, List<dynamic> arguments) {
    int i = 1;
    removeAllAndPush('/${routeNames[0]}', '/', arguments: arguments[0]);
    for (; i < routeNames.length; i++) {
      if (i == 0) {
        pushReplacementScreen('/${routeNames[i]}', arguments: arguments[i]);
      }
      pushScreen('/${routeNames[i]}', arguments: arguments[i]);
    }
  }

  Future<dynamic> removeAllAndPush(String routeName, String tillRoute,
      {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, ModalRoute.withName(tillRoute),
        arguments: arguments);
  }

  void pop() {
    return navigatorKey.currentState!.pop();
  }
}
