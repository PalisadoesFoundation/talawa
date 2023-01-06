import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> popAndPushScreen(String routeName, {dynamic arguments}) {
    navigatorKey.currentState!.pop();
    return pushScreen(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void fromInviteLink(List<String> routeNames, List<dynamic> arguments) {
    int i = 0;
    removeAllAndPush('/${routeNames[i]}', '/', arguments: arguments[i]);
    for (i = 1; i < routeNames.length; i++) {
      pushScreen('/${routeNames[i]}', arguments: arguments[i]);
    }
  }

  Future<dynamic> removeAllAndPush(
    String routeName,
    String tillRoute, {
    dynamic arguments,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(tillRoute),
      arguments: arguments,
    );
  }

  void pushDialog(Widget dialog) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: duration,
        content: Text(message),
      ),
    );
  }

  void showTalawaErrorWidget(
    String message, {
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
      padding: EdgeInsets.only(left: 0),
      content: Row(
        children: [
          Container(
            width: 20,
            height: 75,
            decoration: const BoxDecoration(color: Colors.red),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 35,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
      // backgroundColor: Colors.grey,
      backgroundColor: Color.fromRGBO(65, 65, 66, 1),
    ));
  }

  void pop() {
    return navigatorKey.currentState!.pop();
  }
}
