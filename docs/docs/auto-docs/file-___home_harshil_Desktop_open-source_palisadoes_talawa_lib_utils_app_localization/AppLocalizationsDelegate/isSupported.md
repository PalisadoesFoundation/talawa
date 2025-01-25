




isSupported method - AppLocalizationsDelegate class - app\_localization library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/app\_localization.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/)
3. [AppLocalizationsDelegate](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/AppLocalizationsDelegate-class.html)
4. isSupported method

isSupported


dark\_mode

light\_mode




# isSupported method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)
isSupported(

1. dynamic locale

)

## Implementation

```
@override
bool isSupported(Locale locale) {
  // Include all of your supported language codes here
  return ['en', 'es', 'fr', 'hi', 'zh', 'de', 'ja', 'pt']
      .contains(locale.languageCode);
}
```

 


1. [talawa](../../index.html)
2. [app\_localization](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/)
3. [AppLocalizationsDelegate](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/AppLocalizationsDelegate-class.html)
4. isSupported method

##### AppLocalizationsDelegate class





talawa
1.0.0+1






