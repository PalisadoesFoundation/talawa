import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  void pop() {
    return navigatorKey.currentState.pop();
  }
}
