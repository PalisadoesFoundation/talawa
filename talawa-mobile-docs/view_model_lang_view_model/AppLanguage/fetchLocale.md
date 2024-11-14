


# fetchLocale method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> fetchLocale
()





<p>This function fetch the language of the user's app.</p>



## Implementation

```dart
Future<void> fetchLocale() async {
  final prefs = await SharedPreferences.getInstance();
  final String langCode = prefs.getString('language_code') ?? 'en';
  _appLocale = Locale(langCode);

  notifyListeners();
}
```







