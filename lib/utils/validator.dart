class Validator{
    
    static String validateFirstName(String value) {
    if (value.length < 2) {
      return 'First name must be at least 2 characters.';
    }
    return null;
  }

  static String validateLastName(String value) {
    if (value.length < 2) {
      return 'Last name must be at least 2 characters.';
    }
    return null;
  }

  static String validateEmail(String value) {
    bool emailDup = false;
    RegExp regExp = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
        multiLine: false);
    if (!regExp.hasMatch(value)) {
      return 'E-mail Address must be a valid email address.';
    }
    if(emailDup == true){
      return 'E-mail Address already exists';
    }
    return null;
  }

  static String validatePassword(String value) {
    if (value.length < 4) {
      return 'Password must be at least 4 characters.';
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
}