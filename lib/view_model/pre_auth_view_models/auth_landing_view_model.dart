import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// AuthLandingViewModel class helps to interact with model to serve data.
///
/// and react to user's input for Set Url Section.
/// Methods include:
/// * `checkURLandNavigate`
/// * `initialise`
/// * `checkURLandNavigate`
/// * `checkURLandShowPopUp`

class AuthLandingViewModel extends BaseModel {
  /// organizationID.
  String orgId = '-1';

  /// imageUrlKey.
  static const imageUrlKey = "imageUrl";

  /// urlKey.
  static const urlKey = "url";

  /// url.
  // Removed auto-loading from .env - URL should be set via SetUrl screen
  // final url = dotenv.get("API_URL");

  /// This function initialises the variables.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initialise() {
    // URL should already be set via SetUrl screen
    // No longer auto-loading from .env file
    final box = Hive.box('url');
    final cachedUrl = box.get(urlKey);
    if (cachedUrl != null && cachedUrl.toString().isNotEmpty) {
      graphqlConfig.getOrgUrl();
    }

    notifyListeners();
  }

  /// This function check the URL and navigate to the respective URL.
  ///
  /// **params**:
  /// * `navigateTo`: url
  /// * `argument`: message
  ///
  /// **returns**:
  ///   None

  Future<void> checkURLandNavigate(String navigateTo, String argument) async {
    /// if the url is valid.

    await actionHandlerService.performAction(
      actionType: ActionType.critical,
      criticalActionFailureMessage: navigateTo == '/login'
          ? TalawaErrors.youAreOfflineUnableToLogin
          : TalawaErrors.youAreOfflineUnableToSignUp,
      action: () async {
        navigationService.pushDialog(
          const CustomProgressDialog(
            key: Key('UrlCheckProgress'),
          ),
        );
        // Get URL from Hive cache (set via SetUrl screen)
        final box = Hive.box('url');
        final String? uri = box.get(urlKey) as String?;

        if (uri == null || uri.isEmpty) {
          navigationService.pop();
          navigationService.showTalawaErrorSnackBar(
            AppLocalizations.of(navigationService.navigatorKey.currentContext!)!
                .strictTranslate('No URL configured. Please set URL first.'),
            MessageType.error,
          );
          return null;
        }

        final bool? urlPresent =
            await locator<Validator>().validateUrlExistence(uri);
        if (urlPresent! == true) {
          navigationService.pop();
          graphqlConfig.getOrgUrl();
          navigationService.pushScreen(navigateTo, arguments: argument);
        } else {
          navigationService.pop();
          navigationService.showTalawaErrorSnackBar(
            "URL doesn't exist/no connection please check",
            MessageType.error,
          );
        }
        return null;
      },
    );
  }
}
