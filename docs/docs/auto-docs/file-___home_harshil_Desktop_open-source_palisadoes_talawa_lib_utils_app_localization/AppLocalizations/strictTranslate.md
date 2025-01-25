




strictTranslate method - AppLocalizations class - app\_localization library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/app\_localization.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/)
3. [AppLocalizations](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/AppLocalizations-class.html)
4. strictTranslate method

strictTranslate


dark\_mode

light\_mode




# strictTranslate method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
strictTranslate(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) key

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
2. [app\_localization](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/)
3. [AppLocalizations](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/AppLocalizations-class.html)
4. strictTranslate method

##### AppLocalizations class





talawa
1.0.0+1






