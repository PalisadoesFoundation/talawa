
<div>

# load method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[AppLocalizations](../../utils_app_localization/AppLocalizations-class.html)]\>]]
load(

1.  [[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]
    locale]

)


override




Start loading the resources for `locale`. The returned future completes
when the resources have finished loading.

It\'s assumed that this method will return an object that contains a
collection of related string resources (typically defined with one
method per resource). The object will be retrieved with
[Localizations.of](https://api.flutter.dev/flutter/widgets/Localizations/of.html).



## Implementation

``` language-dart
@override
Future<AppLocalizations> load(Locale locale) async {
  // AppLocalizations class is where the JSON loading actually runs
  final AppLocalizations localizations =
      AppLocalizations(locale, isTest: isTest);
  if (isTest) {
    await localizations.loadTest(locale);
  } else {
    await localizations.;
  }

  return localizations;
}
```







1.  [talawa](../../index.html)
2.  [app_localization](../../utils_app_localization/)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4.  load method

##### AppLocalizationsDelegate class







