




load method - AppLocalizationsDelegate class - app\_localization library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/app\_localization.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/)
3. [AppLocalizationsDelegate](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/AppLocalizationsDelegate-class.html)
4. load method

load


dark\_mode

light\_mode




# load method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[AppLocalizations](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/AppLocalizations-class.html)>
load(

1. dynamic locale

)

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
2. [app\_localization](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/)
3. [AppLocalizationsDelegate](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_app_localization/AppLocalizationsDelegate-class.html)
4. load method

##### AppLocalizationsDelegate class





talawa
1.0.0+1






