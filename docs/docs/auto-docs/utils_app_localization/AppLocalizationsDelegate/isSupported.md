
<div>

# isSupported method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
isSupported(

1.  [[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]
    locale]

)


override




Whether resources for the given locale can be loaded by this delegate.

Return true if the instance of `T` loaded by this delegate\'s
[load](../../utils_app_localization/AppLocalizationsDelegate/load.html)
method supports the given `locale`\'s language.



## Implementation

``` language-dart
@override
bool isSupported(Locale locale) {
  // Include all of your supported language codes here
  return ['en', 'es', 'fr', 'hi', 'zh', 'de', 'ja', 'pt']
      .contains(locale.languageCode);
}
```







1.  [talawa](../../index.html)
2.  [app_localization](../../utils_app_localization/)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4.  isSupported method

##### AppLocalizationsDelegate class







