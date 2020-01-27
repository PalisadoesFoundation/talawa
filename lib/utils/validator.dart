class Validator{
  
    String validateFirstName(String value) {
    if (value.length < 4) {
      return 'First name must be at least 4 characters.';
    }
    return null;
  }

  String validateLastName(String value) {
    if (value.length < 4) {
      return 'Last name must be at least 4 characters.';
    }
    return null;
  }

  String validateEmail(String value) {
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

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Password must be at least 4 characters.';
    }

    return null;
  }

  String validatePasswordConfirm(String value, String comparator) {
    if (value != comparator) {
      return 'Password does not match original';
    }
    return null;
  }

    String validateTitle(String value) {
    if (value.length < 4) {
      return 'Title must be at least 4 characters.';
    }

    return null;
  }

  String validateDateTime(DateTime value) {
    if (value == null) {
      return 'Date field must not be left blank.';
    }

    return null;
  }

  String validateDescription(String value) {
    if (value.length < 5 || value.length > 50) {
      return 'Description field must range between\n 5 and 30 characters';
    }

    return null;
  }
}