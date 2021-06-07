import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:talawa/services/app_localization.dart';

class Validator {
  static String validateURL(String value, BuildContext context) {
    if (value.isEmpty) {
      return AppLocalizations.of(context)
          .translate('Please verify URL first')
          .toUpperCase();
    }
    return null;
  }

  static String validateFirstName(String value, [BuildContext context]) {
    // ignore: unnecessary_raw_strings
    const String pattern = r'(?=.*?[A-Za-z]).+';
    final RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      if (context != null) {
        return AppLocalizations.of(context)
            .translate('Firstname must not be left blank.');
      }
      return 'Firstname must not be left blank.';
    }
    if (!regex.hasMatch(value)) {
      if (context != null) {
        return AppLocalizations.of(context).translate('Invalid Firstname');
      }
      return "Invalid Firstname";
    }
    return null;
  }

  static String validateLastName(String value, [BuildContext context]) {
    // ignore: unnecessary_raw_strings
    const String pattern = r'(?=.*?[A-Za-z]).+';
    final RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      if (context != null) {
        return AppLocalizations.of(context)
            .translate('Lastname must not be left blank.');
      }
      return 'Lastname must not be left blank.';
    }
    if (!regex.hasMatch(value)) {
      if (context != null) {
        return AppLocalizations.of(context).translate("Invalid Lastname");
      }
      return "Invalid Lastname";
    }
    return null;
  }

  static String validateEmail(String email, [BuildContext context]) {
    // If email is empty return.
    if (email.isEmpty) {
      if (context != null) {
        return AppLocalizations.of(context)
            .translate("Email must not be left blank");
      }
      return "Email must not be left blank";
    }

    final bool isValid = EmailValidator.validate(
      email,
    );
    if (!isValid) {
      if (context != null) {
        return AppLocalizations.of(context)
            .translate('Please enter a valid Email Address');
      }
      return 'Please enter a valid Email Address';
    }
    return null;
  }

  static String validatePassword(String password, [BuildContext context]) {
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
      if (context != null) {
        return AppLocalizations.of(context).translate("Invalid Password");
      }
      return "Invalid Password";
    }
    if (!noSpaceRegex.hasMatch(password)) {
      if (context != null) {
        return AppLocalizations.of(context)
            .translate("Password must not contain spaces");
      }
      return "Password must not contain spaces";
    }

    return null;
  }

  static String validatePasswordConfirm(String value, String comparator,
      [BuildContext context]) {
    if (value != comparator) {
      if (context != null) {
        return AppLocalizations.of(context)
            .translate('Password does not match original');
      }
      return 'Password does not match original';
    }
    return null;
  }

  static String validateTitle(String value, BuildContext context) {
    if (value.length < 4) {
      return AppLocalizations.of(context)
          .translate('Title must be at least 4 characters.');
    }

    return null;
  }

  static String validateDateTime(DateTime value, BuildContext context) {
    if (value == null) {
      return AppLocalizations.of(context)
          .translate('Date field must not be left blank.');
    }

    return null;
  }

  static String validateDescription(String value, BuildContext context) {
    if (value.length < 5 || value.length > 50) {
      return AppLocalizations.of(context).translate(
          'Description field must range between 5 and 30 characters');
    }

    return null;
  }

  static String validateOrgName(String value, BuildContext context) {
    final String validatingValue = value.replaceAll(RegExp(r"\s+"), "");
    debugPrint(validatingValue.length.toString());
    if (validatingValue.isEmpty) {
      return AppLocalizations.of(context)
          .translate('Organization Description must not be left blank.');
    }
    if (value.length > 40) {
      return AppLocalizations.of(context)
          .translate('Organization Name must not exceed 40 letters');
    }
    return null;
  }

  static String validateOrgDesc(String value, BuildContext context) {
    final String validatingValue = value.replaceAll(RegExp(r"\s+"), "");
    debugPrint(validatingValue.length.toString());
    if (validatingValue.isEmpty) {
      return AppLocalizations.of(context)
          .translate('Organization Description must not be left blank.');
    }
    if (value.length > 5000) {
      return AppLocalizations.of(context)
          .translate('Organization Description must not exceed 5000 letters');
    }
    return null;
  }

  static String validateOrgAttendeesDesc(String value, BuildContext context) {
    final String validatingValue = value.replaceAll(RegExp(r"\s+"), "");
    debugPrint(validatingValue.length.toString());
    if (validatingValue.isEmpty) {
      return AppLocalizations.of(context)
          .translate('Attendees Description must not be left blank.');
    }
    if (value.length > 5000) {
      return AppLocalizations.of(context)
          .translate('Attendees Description must not exceed 5000 letters');
    }
    return null;
  }
}
