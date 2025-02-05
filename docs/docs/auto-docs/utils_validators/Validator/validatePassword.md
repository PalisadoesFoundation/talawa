


# validatePassword method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? validatePassword
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) password)








## Implementation

```dart
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







