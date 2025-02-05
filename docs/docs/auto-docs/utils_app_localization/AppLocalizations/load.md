


# load method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)> load
()








## Implementation

```dart
Future<bool> load() async {
  // Load the language JSON file from the "lang" folder
  final String jsonString =
      await rootBundle.loadString('lang/${locale.languageCode}.json');
  final Map<String, dynamic> jsonMap =
      json.decode(jsonString) as Map<String, dynamic>;

  _localizedStrings = jsonMap.map((key, value) {
    return MapEntry(key, value.toString());
  });

  return true;
}
```







