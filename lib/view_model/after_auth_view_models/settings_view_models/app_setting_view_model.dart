import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/talawa_error_dialog.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// ViewModel for the App Settings functionality.
///
/// This ViewModel handles the logic and data for the application settings.
class AppSettingViewModel extends BaseModel {
  // Services
  final _navigationService = locator<NavigationService>();
  // final _appLanguageService = locator<AppLanguage>();

  /// This method destroys the user's session or sign out the user from app, The function asks for the confimation in Custom Alert Dialog.
  ///
  /// **params**:
  /// * `context`: BuildContext of the widget
  ///
  /// **returns**:
  /// * `Future<void>`: Resolves when user logout
  Future<void> logout(BuildContext context) async {
    // push custom alert dialog with the confirmation message.
    _navigationService.pushDialog(logoutDialog());
  }

  /// Launches a website using the provided URL.
  ///
  /// **params**:
  /// * `url`: A [String] representing the URL of the website to be launched.
  ///
  /// **returns**:
  /// * `Future<bool>`: A [Future] that resolves to a [bool] value indicating
  /// whether the website launch was successful.
  Future<bool> launchWebsite(String url) async => await launchUrlString(url);

  /// Creates a custom alert dialog for the logout confirmation.
  ///
  /// This dialog prompts the user with a confirmation message for logout.
  /// The dialog provides options to logout or cancel the operation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Widget`: A [Widget] representing the custom logout confirmation dialog.
  Widget logoutDialog() {
    return CustomAlertDialog(
      reverse: true,
      dialogSubTitle: 'Are you sure you want to logout?',
      successText: 'Logout',
      success: () async {
        await userConfig.userLogOut();
        navigationService.pop();
        if (userConfig.loggedIn) {
          navigationService.pushDialog(
            const TalawaErrorDialog(
              'Unable to logout, please try again.',
              key: Key('TalawaError'),
              messageType: MessageType.error,
            ),
          );
        } else {
          navigationService.removeAllAndPush(
            '/selectLang',
            '/',
            arguments: '0',
          );
        }
      },
    );
  }
}
