



menu

1.  [talawa](../../index.md)
2.  [view_model/lang_view_model.dart](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.md)
4.  localeResoultion method


localeResoultion


 dark_mode   light_mode 




<div>

# localeResoultion method

</div>


[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]
localeResoultion(

1.  [[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.md)?]
    locale, ]
2.  [[[Iterable](https://api.flutter.dev/flutter/dart-core/Iterable-class.html)[\<[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]\>]]
    supportedLocales]

)



This function fetches the appropriate locale for the user\'s app based
on the provided locale and supported locales.

**params**:

-   `locale`: (`Locale?`): The locale to be resolved. Can be null.
-   `supportedLocales`: (`Iterable<Locale>`): The list of supported
    locales in the app.

**returns**:

-   `Locale`: The resolved locale that matches either the language code
    or the country code of the provided locale. If no match is found or
    the provided locale is null, the first supported locale is returned.



## Implementation

``` language-dart
Locale localeResoultion(Locale? locale, Iterable<Locale> supportedLocales) 
```







1.  [talawa](../../index.md)
2.  [lang_view_model](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.md)
4.  localeResoultion method

##### AppLanguage class









 talawa 1.0.0+1 
