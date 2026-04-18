import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
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

  /// Triggers the snackbar UI to show online status.
  ///
  /// **params**:
  /// * `isOnline`: online status of the device.
  ///
  /// **returns**:
  ///   None
  void showConnectivitySnackBar({required bool isOnline}) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      final TextStyle customStyle = Theme.of(context).textTheme.bodyMedium!;
      if (isOnline) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.green,
            content: Text(
              'You are back online!',
              style: customStyle,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 5),
            backgroundColor: const Color.fromRGBO(65, 65, 66, 1),
            content: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'You are ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Offline!',
                    style: customStyle.copyWith(color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
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

  /// Shows an Custom Toast.
  ///
  /// **params**:
  /// * `msg`: Message shown in Toast
  ///
  /// **returns**:
  ///   None
  void showCustomToast(String msg) {
    DelightToastBar(
      builder: (context) {
        return ToastCard(
          title: Text(
            msg,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          leading: const Icon(
            Icons.error_outline,
            color: Colors.redAccent,
          ),
          color: Colors.black.withAlpha((1.0 * 255).toInt()),
        );
      },
    ).show(navigatorKey.currentContext!);
  }

  /// This function pops the current state.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void pop() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      return navigatorKey.currentState!.pop();
    }
  }

  /// This function prints current navigation state.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void printNavigatorState() {
    final navigatorState = navigatorKey.currentState;
    if (navigatorState != null) {
      print('Can pop: ${navigatorState.canPop()}');
      print('Current Route: ${navigatorState.widget}');
      print('Navigator Stack: ${navigatorState.widget}');
      print(
        'Route History: ${navigatorState.widget.pages.map((page) => page.toString()).toList()}',
      );
    }
  }

  /// Shows a progress dialog (loading spinner).
  ///
  /// Call [pop] to dismiss the dialog when the operation completes.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void showProgressDialog() {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  /// Shows a simple Yes/No confirmation dialog.
  ///
  /// **params**:
  /// * `title`: Dialog title.
  /// * `content`: Dialog body text.
  /// * `confirmText`: Label for the confirm button. Defaults to 'Confirm'.
  /// * `cancelText`: Label for the cancel button. Defaults to 'Cancel'.
  ///
  /// **returns**:
  /// * `Future<bool>`: `true` if the user confirmed, `false` otherwise.
  Future<bool> showConfirmDialog({
    required String title,
    required String content,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    Color? confirmColor,
  }) async {
    final bool? result = await showDialog<bool>(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              confirmText,
              style: confirmColor != null
                  ? TextStyle(color: confirmColor)
                  : TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
            ),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  /// Shows a dialog for updating a recurring event with options.
  ///
  /// **params**:
  /// * `isRecurrenceSettingsEdit`: Whether recurrence settings are being edited.
  ///
  /// **returns**:
  /// * `Future<String?>`: Selected recurrence update type, or `null` if cancelled.
  Future<String?> showRecurrenceUpdateOptionDialog({
    required bool isRecurrenceSettingsEdit,
  }) {
    return showDialog<String>(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: const Text('Update Recurring Event'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('How would you like to update this event?'),
            const SizedBox(height: 16),
            if (!isRecurrenceSettingsEdit) ...[
              _buildDialogOption(
                context,
                'Update this event only',
                'single',
              ),
              const SizedBox(height: 8),
            ],
            _buildDialogOption(
              context,
              'Update this and all future events',
              'thisAndFollowing',
            ),
            if (!isRecurrenceSettingsEdit) ...[
              const SizedBox(height: 8),
              _buildDialogOption(
                context,
                'Update all events in the series',
                'series',
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  /// Shows a dialog for deleting a recurring event with options.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<String?>`: Selected deletion type, or `null` if cancelled.
  Future<String?> showRecurringEventDeleteDialog() {
    return showDialog<String>(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: const Text('Delete Recurring Event'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('How would you like to delete this event?'),
            const SizedBox(height: 16),
            _buildDialogOption(
              context,
              'Delete this event only',
              'single',
            ),
            const SizedBox(height: 8),
            _buildDialogOption(
              context,
              'Delete this and all future events',
              'thisAndFollowing',
            ),
            const SizedBox(height: 8),
            _buildDialogOption(
              context,
              'Delete all events in the series',
              'series',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  /// Builds a pressable option row for use inside dialog content.
  Widget _buildDialogOption(BuildContext context, String text, String value) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(value),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text),
      ),
    );
  }
}
