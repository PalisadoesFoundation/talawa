


# strictTranslate method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) strictTranslate
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) key)








## Implementation

```dart
String strictTranslate(String key) {
  if (isTest) return key;

  // ignore: unnecessary_null_comparison
  if (key == null) {
    return '...';
  }

  final String translate = _localizedStrings[key] ?? key;
  return translate;
}
```







