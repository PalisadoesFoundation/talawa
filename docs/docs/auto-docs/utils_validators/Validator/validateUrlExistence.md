


# validateUrlExistence method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?> validateUrlExistence
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) url)








## Implementation

```dart
Future<bool?> validateUrlExistence(String url) async {
  try {
    await http.get(Uri.parse(url));
    return true;
  } on Exception catch (e) {
    debugPrint(e.toString());
    return false;
  }
}
```







