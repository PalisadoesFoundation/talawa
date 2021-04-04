//Validator class hold the RegExp for requested validation

class Validator {
  //Checks if password has minLength
  bool hasMinLength(String password, int minLength) {
    return password.length >= minLength ? true : false;
  }

  //Checks if password has at least uppercaseCount uppercase letter matches
  bool hasMinUppercase(String password, int uppercaseCount) {
    String pattern = '^(.*?[A-Z]){' + uppercaseCount.toString() + ',}';
    return password.contains(new RegExp(pattern));
  }

  //Checks if password has at least numericCount numeric character matches
  bool hasMinNumericChar(String password, int numericCount) {
    String pattern = '^(.*?[0-9]){' + numericCount.toString() + ',}';
    return password.contains(new RegExp(pattern));
  }

  //Checks if password has at least specialCount special character matches
  bool hasMinSpecialChar(String password, int specialCount) {
    String pattern =
        r"^(.*?[$&+,\:;/=?@#|'<>.^*()_%!-]){" + specialCount.toString() + ",}";
    return password.contains(new RegExp(pattern));
  }
}
