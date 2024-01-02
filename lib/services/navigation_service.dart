import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/utils/app_localization.dart';
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
  /// Key for Navigator State.
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Pushes a Screen.
  ///
  /// **params**:
  /// * `routeName`: Name of the Route
  /// * `arguments`: Set of arguments
  ///
  /// **returns**:
  /// * `Future<dynamic>`: resolves if the Screen was succesfully pushed.
  Future<dynamic> pushScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  /// This function pop the initial route and push the new route to the navigator.
  ///
  /// **params**:
  /// * `routeName`: Name of the Route
  /// * `arguments`: Set of arguments
  ///
  /// **returns**:
  /// * `Future<dynamic>`: resolves if the Screen was succesfully popAndPushed.
  Future<dynamic> popAndPushScreen(String routeName, {dynamic arguments}) {
    navigatorKey.currentState!.pop();
    return pushScreen(routeName, arguments: arguments);
  }

  /// This function push the route and replace the screen.
  ///
  /// **params**:
  /// * `routeName`: Name of the Route
  /// * `arguments`: Set of arguments
  ///
  /// **returns**:
  /// * `Future<dynamic>`: resolves if the Screen was succesfully pushedReplacementScreen.
  Future<dynamic> pushReplacementScreen(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  // void fromInviteLink(List<String> routeNames, List<dynamic> arguments) {
  //   int i = 0;
  //   removeAllAndPush('/${routeNames[i]}', '/', arguments: arguments[i]);
  //   for (i = 1; i < routeNames.length; i++) {
  //     pushScreen('/${routeNames[i]}', arguments: arguments[i]);
  //   }
  // }

  /// This function remove all the routes till the particular route and add new route.
  ///
  /// **params**:
  /// * `routeName`: Name of the Route
  /// * `tillRoute`: Route till we want to remove
  /// * `arguments`: Set of arguments
  ///
  /// **returns**:
  /// * `Future<dynamic>`: resolves if the Screen was succesfully removeAllAndPushed.
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

  /// This function remove all the routes till the particular route and add new route.
  ///
  /// **params**:
  /// * `dialog`: Widget to show
  ///
  /// **returns**:
  ///   None
  void pushDialog(Widget dialog) {
    print('came');
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
  ///
  /// **params**:
  /// * `message`: Message would be shown on snackbar
  /// * `duration`: Duration of Snackbar
  ///
  /// **returns**:
  ///   None
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 2),
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: duration,
        content: Text(
          AppLocalizations.of(navigatorKey.currentContext!)!
              .strictTranslate(message),
        ),
      ),
    );
  }

  /// This is used for the quick error of `duration: 2 seconds`.
  ///
  /// **params**:
  /// * `errorMessage`: Error Message shown in snackbar
  /// * `messageType`: Type of Message
  /// * `duration`: Duration of snackbar
  ///
  /// **returns**:
  ///   None
  void showTalawaErrorSnackBar(
    String errorMessage,
    MessageType messageType,
  ) {
    final Duration duration = Duration(milliseconds: errorMessage.length * 80);
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        padding: EdgeInsets.zero,
        duration: duration,
        content: TalawaErrorSnackBar(
          duration: duration,
          messageType: messageType,
          errorMessage: errorMessage,
        ),
        backgroundColor: const Color.fromRGBO(65, 65, 66, 1),
      ),
    );
  }

  /// Shows an Error Dialog Box.
  ///
  /// **params**:
  /// * `errorMessage`: Message shown in dialog
  /// * `messageType`: Type of Message
  ///
  /// **returns**:
  ///   None
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
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void pop() {
    return navigatorKey.currentState!.pop();
  }
}
