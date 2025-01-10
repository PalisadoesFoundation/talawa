


# translate method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? translate
([String](https://api.flutter.dev/flutter/dart-core/String-class.html)? key)








## Implementation

```dart
String? translate(String? key) {
  if (isTest) return key;

  // ignore: unnecessary_null_comparison
  if (key == null) {
    return '...';
  }
  return _localizedStrings[key];
}
```







