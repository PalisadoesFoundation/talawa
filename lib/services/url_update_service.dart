import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// Service for handling URL validation, persistence, and updates.
///
/// This service consolidates the shared URL update logic used across
/// multiple view models (login, signup, set_url) to avoid code duplication.
class UrlUpdateService {
  /// Key for storing URL in Hive.
  static const String urlKey = "url";

  /// Key for storing image URL in Hive.
  static const String imageUrlKey = "imageUrl";

  /// Updates the server URL with validation and persistence.
  ///
  /// This method:
  /// 1. Validates the URL format using [Validator.validateURL]
  /// 2. Checks URL existence using [Validator.validateUrlExistence]
  /// 3. Persists the URL to Hive storage if valid
  /// 4. Updates the GraphQL configuration
  /// 5. Shows appropriate success/failure messages
  ///
  /// **params**:
  /// * `url`: The URL string to validate and update
  /// * `showDialog`: Whether to show a progress dialog during validation
  ///
  /// **returns**:
  /// * `Future<bool>`: true if URL was successfully validated and updated,
  ///   false otherwise
  Future<bool> updateServerUrl(
    String url, {
    bool showDialog = true,
  }) async {
    final trimmedUrl = url.trim();

    // Validate URL format
    final formatValidation = Validator.validateURL(trimmedUrl);
    if (formatValidation != null) {
      navigationService.showTalawaErrorSnackBar(
        formatValidation,
        MessageType.error,
      );
      return false;
    }

    // Show progress dialog if requested
    if (showDialog) {
      navigationService.pushDialog(
        const CustomProgressDialog(key: Key('UrlUpdateProgress')),
      );
    }

    try {
      // Check URL existence
      final urlExists =
          await locator<Validator>().validateUrlExistence(trimmedUrl);

      if (showDialog) {
        navigationService.pop();
      }

      if (urlExists == true) {
        // Persist URL to Hive
        final box = Hive.box('url');
        box.put(urlKey, trimmedUrl);
        box.put(imageUrlKey, "$trimmedUrl/talawa/");

        // Update GraphQL configuration
        graphqlConfig.getOrgUrl();

        // Show success message
        final context = navigationService.navigatorKey.currentContext;
        if (context != null) {
          navigationService.showTalawaErrorSnackBar(
            AppLocalizations.of(context)!
                .strictTranslate('URL updated successfully'),
            MessageType.info,
          );
        }

        return true;
      } else {
        // Show error message for invalid URL
        final context = navigationService.navigatorKey.currentContext;
        if (context != null) {
          navigationService.showTalawaErrorSnackBar(
            AppLocalizations.of(context)!
                .strictTranslate("URL doesn't exist/no connection"),
            MessageType.error,
          );
        }
        return false;
      }
    } catch (e) {
      if (showDialog) {
        navigationService.pop();
      }

      final context = navigationService.navigatorKey.currentContext;
      if (context != null) {
        navigationService.showTalawaErrorSnackBar(
          AppLocalizations.of(context)!
              .strictTranslate('Error updating URL'),
          MessageType.error,
        );
      }
      return false;
    }
  }

  /// Loads the current URL from Hive storage.
  ///
  /// **returns**:
  /// * `String`: The currently saved URL, or empty string if none exists
  String getCurrentUrl() {
    final box = Hive.box('url');
    return box.get(urlKey, defaultValue: '') as String;
  }
}
