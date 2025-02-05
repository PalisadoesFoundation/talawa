


# validateLastName method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? validateLastName
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) value)








## Implementation

```dart
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
```







