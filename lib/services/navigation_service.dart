// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/widgets/talawa_error_dialog.dart';
import 'package:talawa/widgets/talawa_error_snackbar.dart';

/// NavigationService class provides different functions as service in the context of navigation.
///
/// Services include:
/// * `pushScreen`
/// * `popAndPushScreen`
/// * `pushReplacementScreen`
/// * `removeAllAndPush`
/// * `showSnackBar`
/// * `pushDialog`
/// * `showTalawaErrorWidget`
/// * `showTalawaErrorDialog`
/// * `pop`
class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// This function push the route to the navigator.
  ///
  /// params:
  /// * [routeName]
  /// * [arguments] : necessary data for the route
  Future<dynamic> pushScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  /// This function pop the initial route and push the new route to the navigator.
  ///
  /// params:
  /// * [routeName]
  /// * [arguments] : necessary data for the route
  Future<dynamic> popAndPushScreen(String routeName, {dynamic arguments}) {
    navigatorKey.currentState!.pop();
    return pushScreen(routeName, arguments: arguments);
  }

  /// This function push the route and replace the screen.
  ///
  /// params:
  /// * [routeName]
  /// * [arguments] : necessary data for the route
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

  /// This function remove all the routes till the particular route and add new route.
  ///
  /// params:
  /// * [routeName] : route that need to add
  /// * [tillRoute] : remove all route until this route.
  /// * [arguments] : necessary data for the route
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

  /// This function is used to show the custom Dialog.
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

  /// This is used for the quick alert of `duration: 2 seconds` with text message(passed).
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

  void showTalawaErrorSnackBar(
    String errorMessage,
    MessageType messageType, {
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        content: TalawaErrorSnackBar(
          messageType: messageType,
          errorMessage: errorMessage,
        ),
        backgroundColor: const Color.fromRGBO(65, 65, 66, 1),
      ),
    );
  }

  void showTalawaErrorDialog(String errorMessage, MessageType messageType) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return TalawaErrorDialog(
          errorMessage,
          messageType: messageType,
        );
      },
    );
  }

  /// This function pops the current state.
  void pop() {
    return navigatorKey.currentState!.pop();
  }
}
