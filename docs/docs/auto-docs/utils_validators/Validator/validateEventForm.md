


# validateEventForm method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? validateEventForm
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) value, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? label)








## Implementation

```dart
static String? validateEventForm(String value, String? label) {
  if (value.isEmpty) {
    return '$label must not be left blank.';
  }
  // ignore: unnecessary_raw_strings
  const String pattern = r'(?=.*?[A-Za-z]).+';
  final RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return "Invalid $label";
  }
  return null;
}
```







