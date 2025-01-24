




load method - AppLocalizations class - app\_localization library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/app\_localization.dart](../../utils_app_localization/utils_app_localization-library.html)
3. [AppLocalizations](../../utils_app_localization/AppLocalizations-class.html)
4. load method

load


dark\_mode

light\_mode




# load method


Future<bool>
load()

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [app\_localization](../../utils_app_localization/utils_app_localization-library.html)
3. [AppLocalizations](../../utils_app_localization/AppLocalizations-class.html)
4. load method

##### AppLocalizations class





talawa
1.0.0+1






