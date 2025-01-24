




localeResoultion method - AppLanguage class - lang\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/lang\_view\_model.dart](../../view_model_lang_view_model/view_model_lang_view_model-library.html)
3. [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4. localeResoultion method

localeResoultion


dark\_mode

light\_mode




# localeResoultion method


[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)
localeResoultion(

1. [Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)? locale,
2. Iterable<[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)> supportedLocales

)

This function fetches the appropriate locale for the user's app based on the provided locale and supported locales.

**params**:

* `locale`: (`Locale?`): The locale to be resolved. Can be null.
* `supportedLocales`: (`Iterable<Locale>`): The list of supported locales in the app.

**returns**:

* `Locale`: The resolved locale that matches either the language code or the country code of the provided locale.
  If no match is found or the provided locale is null, the first supported locale is returned.

## Implementation

```
Locale localeResoultion(Locale? locale, Iterable<Locale> supportedLocales) {
  if (locale == null) {
    debugPrint("*language locale is null!!!");
    return supportedLocales.first;
  }
  for (final Locale supportedLocale in supportedLocales) {
    if (supportedLocale.languageCode == locale.languageCode ||
        supportedLocale.countryCode == locale.countryCode) {
      return supportedLocale;
    }
  }
  return supportedLocales.first;
}
```

 


1. [talawa](../../index.html)
2. [lang\_view\_model](../../view_model_lang_view_model/view_model_lang_view_model-library.html)
3. [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4. localeResoultion method

##### AppLanguage class





talawa
1.0.0+1






