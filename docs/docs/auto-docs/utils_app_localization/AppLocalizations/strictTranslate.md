




strictTranslate method - AppLocalizations class - app\_localization library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/app\_localization.dart](../../utils_app_localization/utils_app_localization-library.html)
3. [AppLocalizations](../../utils_app_localization/AppLocalizations-class.html)
4. strictTranslate method

strictTranslate


dark\_mode

light\_mode




# strictTranslate method


String
strictTranslate(

1. String key

)

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [app\_localization](../../utils_app_localization/utils_app_localization-library.html)
3. [AppLocalizations](../../utils_app_localization/AppLocalizations-class.html)
4. strictTranslate method

##### AppLocalizations class





talawa
1.0.0+1






