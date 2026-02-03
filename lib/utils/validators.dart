import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///This class creats various validator methods for the application.
///
///They are used to validate information given by the users.
class Validator {
  /// Method to validate already existing URL.
  ///
  /// **params**:
  /// * `url`: the entered URL
  /// * `client`: optional HTTP client for testing (defaults to new http.Client)
  ///
  /// **returns**:
  /// * `Future<bool>`: true if URL exists, false otherwise.
  Future<bool> validateUrlExistence(String url, {http.Client? client}) async {
    final httpClient = client ?? http.Client(); // coverage:ignore-line
    try {
      final response = await httpClient
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 5));
      // Return true only for success status codes (200-399)
      return response.statusCode >= 200 && response.statusCode < 400;
    } on TimeoutException catch (e) {
      debugPrint('Timeout: $e');
      return false;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    } finally {
      // Only close the client if we created it
      if (client == null) {
        httpClient.close(); // coverage:ignore-line
      }
    }
  }
}

/// A generic validators class that provides common validation methods.
class Validators {
  /// Private constructor to prevent instantiation.
  const Validators._(); // coverage:ignore-line

  /// Validates that the string is not null or empty.
  ///
  /// **params**:
  /// * `v`: The string to validate.
  ///
  /// **returns**:
  /// * `String?`: 'Required' if invalid, null otherwise.
  static String? required(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Required' : null;

  /// Validates an event form field (Title, Description).
  ///
  /// Checks that the value is not empty and contains at least one letter.
  ///
  /// **params**:
  /// * `v`: The string to validate.
  /// * `label`: The field label (e.g., 'Title', 'Description').
  ///
  /// **returns**:
  /// * `String?`: Error message if invalid, null otherwise.
  static String? eventField(String? v, String label) {
    final t = v?.trim() ?? '';
    if (t.isEmpty) return '$label must not be left blank.';
    // Requires at least one letter
    final regex = RegExp('(?=.*?[A-Za-z]).+');
    if (!regex.hasMatch(t)) return 'Invalid $label';
    return null;
  }

  /// Validates that the string is a valid email.
  ///
  /// **params**:
  /// * `v`: The email string to validate.
  ///
  /// **returns**:
  /// * `String?`: Error message if invalid, null otherwise.
  static String? email(String? v) {
    if (v == null || v.isEmpty) return 'Required';
    // Regex that requires at least one dot in the domain part
    final re = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)+$");
    return re.hasMatch(v) ? null : 'Invalid email';
  }

  /// Validates that the string has a minimum length.
  ///
  /// By default, whitespace is counted. Set [trim] to `true` to trim leading/
  /// trailing whitespace before checking length (useful for names but NOT for
  /// passwords where spaces may be valid characters).
  ///
  /// **params**:
  /// * `v`: The string to validate.
  /// * `n`: The minimum length.
  /// * `trim`: Whether to trim whitespace before checking. Default: `false`.
  ///
  /// **returns**:
  /// * `String?`: Error message if invalid, null otherwise.
  static String? minLen(String? v, int n, {bool trim = false}) {
    final value = trim ? v?.trim() : v;
    return (value == null || value.length < n) ? 'Min length $n' : null;
  }

  /// Validates the password strength.
  ///
  /// **params**:
  /// * `v`: The password string to validate.
  ///
  /// **returns**:
  /// * `String?`: Error message if invalid, null otherwise.
  static String? password(String? v) {
    if (v == null || v.isEmpty) return 'Password must not be left blank';

    // Regex for no spaces allowed
    final noSpaceRegex = RegExp(r'^\S+$');
    if (!noSpaceRegex.hasMatch(v)) {
      return "Password must not contain spaces";
    }

    // Regex for: at least 8 chars, 1 numeric, 1 uppercase, 1 lowercase, 1 special char
    final regExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*%^~.]).{8,}$');
    if (!regExp.hasMatch(v)) {
      return "Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)";
    }
    return null;
  }

  /// Validates that the string is a valid URL.
  ///
  /// **params**:
  /// * `v`: The string to validate.
  ///
  /// **returns**:
  /// * `String?`: Error message if invalid, null otherwise.
  static String? url(String? v) {
    if (v == null || v.isEmpty) return 'Please verify URL first';
    final uri = Uri.tryParse(v);
    // Require valid scheme AND non-empty host
    final bool validURL = uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
    return validURL ? null : 'Enter a valid URL';
  }

  /// Validates password confirmation.
  ///
  /// **params**:
  /// * `v`: The password confirmation string.
  /// * `comparator`: The original password to compare against.
  ///
  /// **returns**:
  /// * `String?`: Error message if passwords do not match, null otherwise.
  static String? passwordConfirm(String? v, String? comparator) {
    if (v == null || v.isEmpty || comparator == null || comparator.isEmpty) {
      return 'Password cannot be empty';
    }
    if (v != comparator) {
      return 'Password does not match original';
    }
    return null;
  }

  /// Validates that event end date/time is not before start date/time.
  ///
  /// **params**:
  /// * `startDate`: The start date of the event.
  /// * `startTime`: The start time of the event.
  /// * `endDate`: The end date of the event.
  /// * `endTime`: The end time of the event.
  ///
  /// **returns**:
  /// * `String?`: Error message if end date/time is before start date/time, null otherwise.
  static String? eventDateTime(
    DateTime startDate,
    TimeOfDay startTime,
    DateTime endDate,
    TimeOfDay endTime,
  ) {
    final start = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
      startTime.hour,
      startTime.minute,
    );
    final end = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
      endTime.hour,
      endTime.minute,
    );

    if (end.isBefore(start)) {
      return 'Event end date/time cannot be before start date/time';
    }
    return null;
  }

  /// Validates that event start date is not in the past.
  ///
  /// **params**:
  /// * `startDate`: The start date of the event.
  ///
  /// **returns**:
  /// * `String?`: Error message if date is in the past, null otherwise.
  static String? eventStartDate(DateTime startDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (startDate.isBefore(today)) {
      return 'Cannot create events having date prior than today';
    }
    return null;
  }
}
