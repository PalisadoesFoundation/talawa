import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:talawa/constants/app_strings.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
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
  final url = dotenv.get("API_URL");

  /// This function initialises the variables.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None

  void initialise() {
    final box = Hive.box('url');
    box.put(urlKey, url);
    box.put(imageUrlKey, "$url/talawa/");
    graphqlConfig.getOrgUrl();

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
        final String uri = url;
        final bool? urlPresent =
            await locator<Validator>().validateUrlExistence(uri);
        if (urlPresent! == true) {
          final box = Hive.box('url');
          box.put(urlKey, uri);
          box.put(imageUrlKey, "$uri/talawa/");
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
