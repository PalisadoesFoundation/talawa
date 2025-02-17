
<div>

# load method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]\>]]




## Implementation

``` language-dart
Future<bool>  async {
  // Load the language JSON file from the "lang" folder
  final String jsonString =
      await rootBundle.loadString('lang/${locale.languageCode}.json');
  final Map<String, dynamic> jsonMap =
      json.decode(jsonString) as Map<String, dynamic>;

  _localizedStrings = jsonMap.map((key, value) {
    return MapEntry(key, value.);
  });

  return true;
}
```







1.  [talawa](../../index.md)
2.  [app_localization](../../utils_app_localization/)
3.  [AppLocalizations](../../utils_app_localization/AppLocalizations-class.md)
4.  load method

##### AppLocalizations class







