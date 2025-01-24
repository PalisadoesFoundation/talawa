




isSupported method - AppLocalizationsDelegate class - app\_localization library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/app\_localization.dart](../../utils_app_localization/utils_app_localization-library.html)
3. [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4. isSupported method

isSupported


dark\_mode

light\_mode




# isSupported method


1. @override

bool
isSupported(

1. [Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html) locale

)
override

Whether resources for the given locale can be loaded by this delegate.

Return true if the instance of `T` loaded by this delegate's [load](../../utils_app_localization/AppLocalizationsDelegate/load.html)
method supports the given `locale`'s language.


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
2. [app\_localization](../../utils_app_localization/utils_app_localization-library.html)
3. [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4. isSupported method

##### AppLocalizationsDelegate class





talawa
1.0.0+1






