import 'package:talawa/locator.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// ViewModel for the App Settings functionality.
///
/// This ViewModel handles the logic and data for the application settings.
class AppSettingViewModel extends BaseModel {
  // final _appLanguageService = locator<AppLanguage>();

  /// This method destroys the user's session or sign out the user from app, The function asks for the confimation in Custom Alert Dialog.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<bool>`: A [Future] that resolves to a [bool] value indicating whether the user has been logged out.
  Future<bool> logout() async {
    // push custom alert dialog with the confirmation message.
    final bool isloggedOut = await userConfig.userLogOut();
    return isloggedOut;
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
}
