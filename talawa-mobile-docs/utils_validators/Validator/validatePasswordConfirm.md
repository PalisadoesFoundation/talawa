


# validatePasswordConfirm method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? validatePasswordConfirm
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) value, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) comparator)








## Implementation

```dart
static String? validatePasswordConfirm(
  String value,
  String comparator,
) {
  if (value != comparator) {
    return 'Password does not match original';
  }
  return null;
}
```







