import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Validator {
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

    if (!regExp.hasMatch(password)) {
      return "Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)";
    }
    if (!noSpaceRegex.hasMatch(password)) {
      return "Password must not contain spaces";
    }

    return null;
  }

  static String? validatePasswordConfirm(
    String value,
    String comparator,
  ) {
    if (value != comparator) {
      return 'Password does not match original';
    }
    return null;
  }

  static Future<bool?> validateUrlExistence(String url) async {
    try {
      await http.get(Uri.parse(url));
      return true;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

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
