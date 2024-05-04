


# validateFirstName method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? validateFirstName
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) value)








## Implementation

```dart
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
```







