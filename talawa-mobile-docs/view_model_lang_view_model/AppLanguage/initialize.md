


# initialize method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> initialize
()








## Implementation

```dart
Future<void> initialize() async {
  _appLocale = const Locale('en');
  await fetchLocale();
}
```







