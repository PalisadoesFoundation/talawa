




load method - AppLocalizationsDelegate class - app\_localization library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/app\_localization.dart](../../utils_app_localization/utils_app_localization-library.html)
3. [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4. load method

load


dark\_mode

light\_mode




# load method


1. @override

Future<[AppLocalizations](../../utils_app_localization/AppLocalizations-class.html)>
load(

1. [Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html) locale

)
override

Start loading the resources for `locale`. The returned future completes
when the resources have finished loading.

It's assumed that this method will return an object that contains a
collection of related string resources (typically defined with one method
per resource). The object will be retrieved with [Localizations.of](https://api.flutter.dev/flutter/widgets/Localizations/of.html).


## Implementation

```
@override
Future<AppLocalizations> load(Locale locale) async {
  // AppLocalizations class is where the JSON loading actually runs
  final AppLocalizations localizations =
      AppLocalizations(locale, isTest: isTest);
  if (isTest) {
    await localizations.loadTest(locale);
  } else {
    await localizations.load();
  }

  return localizations;
}
```

 


1. [talawa](../../index.html)
2. [app\_localization](../../utils_app_localization/utils_app_localization-library.html)
3. [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4. load method

##### AppLocalizationsDelegate class





talawa
1.0.0+1






