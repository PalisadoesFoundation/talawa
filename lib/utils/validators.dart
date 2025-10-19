import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///This class creats various validator methods for the application.
///
///They are used to validate information given by the users.
class Validator {
  /// Method to validate an organization's URL.
  ///
  /// **params**:
  /// * `value`: the URL of the organization
  ///
  /// **returns**:
  /// * `String?`: error message if URL is invalid.
  static String? validateURL(
    String value,
  ) {
    if (value.isEmpty) {
      return 'Please verify URL first';
    }
    final bool validURL = Uri.parse(value).isAbsolute;
    if (!validURL) {
      return 'Enter a valid URL';
    }
    return null;
  }

  /// Method to validate a user's name.
  ///
  /// **params**:
  /// * `value`: the value of the  name
  ///
  /// **returns**:
  /// * `String?`: error message if  name is invalid.
  static String? validateName(String value) {
    if (value.trim().isEmpty) {
      return 'Name must not be left blank.';
    }
    // ignore: unnecessary_raw_strings
    const String pattern = r'(?=.*?[A-Za-z]).+';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Invalid Name";
    }
    return null;
  }

  /// Method to validate a user's email.
  ///
  /// **params**:
  /// * `email`: the entered email
  ///
  /// **returns**:
  /// * `String?`: error message if email is invalid.
  static String? validateEmail(
    String email,
  ) {
    // If email is empty return.
    if (email.isEmpty) {
      return "Email must not be left blank";
    }
    const String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(email)) {
      return 'Please enter a valid Email Address';
    }
    return null;
  }

  /// Method to validate password.
  ///
  /// **params**:
  /// * `password`: the entered password
  ///
  /// **returns**:
  /// * `String?`: error message if password is invalid.
  static String? validatePassword(
    String password,
  ) {
    // If password is empty return.
    if (password.isEmpty) {
      return "Password must not be left blank";
    }
    const String pattern =
        r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*%^~.]).{8,}$';
    final RegExp regExp = RegExp(pattern);

    //Regex for no spaces allowed
    const String noSpaces = r'^\S+$';
    final RegExp noSpaceRegex = RegExp(noSpaces);

    if (!noSpaceRegex.hasMatch(password)) {
      return "Password must not contain spaces";
    }
    if (!regExp.hasMatch(password)) {
      return "Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)";
    }

    return null;
  }

  /// Method to valid password re-entered for confirmation.
  ///
  /// **params**:
  /// * `value`: the entered password
  /// * `comparator`: the original password
  ///
  /// **returns**:
  /// * `String?`: error message if password is invalid.
  static String? validatePasswordConfirm(
    String value,
    String comparator,
  ) {
    if (value != comparator) {
      return 'Password does not match original';
    }
    return null;
  }

  /// Method to validate already exisiting URL.
  ///
  /// **params**:
  /// * `url`: the entered URL
  ///
  /// **returns**:
  /// * `Future<bool?>`: true if URL exists, false otherwise.
  Future<bool?> validateUrlExistence(String url) async {
    try {
      await http.get(Uri.parse(url));
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  /// Method to validate event form.
  ///
  /// **params**:
  /// * `value`: the value of the field
  /// * `label`: the (optional) label of the field
  ///
  /// **returns**:
  /// * `String?`: error message if field is invalid.
  static String? validateEventForm(String value, String? label) {
    if (value.isEmpty) {
      return '$label must not be left blank.';
    }
    // ignore: unnecessary_raw_strings
    const String pattern = r'(?=.*?[A-Za-z]).+';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Invalid $label";
    }
    return null;
  }

  /// Method to validate event time.
  ///
  /// **params**:
  /// * `startTime`: the start time of the event
  /// * `endTime`: the end time of the event
  ///
  /// **returns**:
  /// * `String?`: error message if time is invalid.
  static String? validateEventTime(TimeOfDay startTime, TimeOfDay endTime) {
    if (startTime.hour > endTime.hour ||
        (startTime.hour == endTime.hour && startTime.minute > endTime.minute)) {
      return 'Start time must be before or equal to end time';
    }
    return null;
  }
}
