




validatePassword method - Validator class - validators library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/validators.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/)
3. [Validator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/Validator-class.html)
4. validatePassword static method

validatePassword


dark\_mode

light\_mode




# validatePassword static method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?
validatePassword(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) password

)

Method to validate password.

**params**:

* `password`: the entered password

**returns**:

* `String?`: error message if password is invalid.

## Implementation

```
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
```

 


1. [talawa](../../index.html)
2. [validators](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/)
3. [Validator](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_validators/Validator-class.html)
4. validatePassword static method

##### Validator class





talawa
1.0.0+1






