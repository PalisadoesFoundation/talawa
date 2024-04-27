


# validateURL method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? validateURL
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) value)








## Implementation

```dart
static String? validateURL(
  String value,
) {
  if (value.isEmpty) {
    return 'Please verify URL first';
  }
  final bool validURL = Uri.parse(value).isAbsolute;
  if (!validURL) {
    return 'Enter a valid URL';
  }
  return null;
}
```







