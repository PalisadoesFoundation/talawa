import 'package:email_validator/email_validator.dart';

class Validator {
  static String validateURL(String value) {
    if (value.length == 0) {
      return 'Please verify URL first'.toUpperCase();
    }
    return null;
  }

  static String validateFirstName(String value) {
    if (value.length == 0) {
      return 'Firstname must not be left blank.';
    }
    return null;
  }

  static String validateLastName(String value) {
    if (value.length == 0) {
      return 'Lastname must not be left blank.';
    }
    return null;
  }

  static String validateEmail(String email) {
    // If email is empty return.
    if (email.isEmpty) {
      return "Email must not be left blank";
    }

    final bool isValid = EmailValidator.validate(email);
    if (!isValid) {
      return 'Please enter a valid Email Address';
    }
    return null;
  }

  // static String validateEmail(String value) {
  //   bool emailDup = false;
  //   RegExp regExp = new RegExp(
  //       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  //       multiLine: false);
  //   if (!regExp.hasMatch(value)) {
  //     return 'E-mail Address must be a valid email address.';
  //   }
  //   if(emailDup == true){
  //     return 'E-mail Address already exists';
  //   }
  //   return null;
  // }

  static String validatePassword(String password) {
    // If password is empty return.
    if (password.isEmpty) {
      return "Password must not be left blank";
    }
    String pattern = r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*%^~.]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (!regExp.hasMatch(password)) {
      return "Invalid Password";
    }
    return null;
  }

  static String validatePasswordConfirm(String value, String comparator) {
    if (value != comparator) {
      return 'Password does not match original';
    }
    return null;
  }

  static String validateTitle(String value) {
    if (value.length < 4) {
      return 'Title must be at least 4 characters.';
    }

    return null;
  }

  static String validateDateTime(DateTime value) {
    if (value == null) {
      return 'Date field must not be left blank.';
    }

    return null;
  }

  static String validateDescription(String value) {
    if (value.length < 5 || value.length > 50) {
      return 'Description field must range between\n 5 and 30 characters';
    }

    return null;
  }

  static String validateOrgName(String value) {
    if (value.length == 0) {
      return 'Organization Name must not be left blank.';
    }
    if (value.length > 40) {
      return 'Organization Name must not exceed 40 letters';
    }
    return null;
  }

  static String validateOrgDesc(String value) {
    if (value.length == 0) {
      return 'Organization Description must not be left blank.';
    }
    if (value.length > 5000) {
      return 'Organization Description must not exceed 5000 letters';
    }
    return null;
  }

  static String validateOrgAttendeesDesc(String value) {
    if (value.length == 0) {
      return 'Attendees Description must not be left blank.';
    }
    if (value.length > 5000) {
      return 'Attendees Description must not exceed 5000 letters';
    }
    return null;
  }
}
