


# validateEmail method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? validateEmail
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) email)








## Implementation

```dart
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
```







