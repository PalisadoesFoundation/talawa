// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

///This class creats various validator methods for the application.
///They are used to validate information given by the users.
class Validator {
  //Method to validate an organization's URL.
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

  //Method to validate a user's first name
  static String? validateFirstName(String value) {
    if (value.isEmpty) {
      return 'Firstname must not be left blank.';
    }
    // ignore: unnecessary_raw_strings
    const String pattern = r'(?=.*?[A-Za-z]).+';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Invalid Firstname";
    }
    return null;
  }

  //Method to validate a user's last name
  static String? validateLastName(String value) {
    if (value.isEmpty) {
      return 'Lastname must not be left blank.';
    }
    // ignore: unnecessary_raw_strings
    const String pattern = r"(?=.*?[A-Za-z]).+";
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Invalid Lastname";
    }
    return null;
  }

  //Method to validate a user's email
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

  //Method to validate password
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

  //Method to valid password re-entered for confirmation
  static String? validatePasswordConfirm(
    String value,
    String comparator,
  ) {
    if (value != comparator) {
      return 'Password does not match original';
    }
    return null;
  }

  //Method to validate already exisiting URL
  Future<bool?> validateUrlExistence(String url) async {
    try {
      await http.get(Uri.parse(url));
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  //Method to validate event form
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
}
