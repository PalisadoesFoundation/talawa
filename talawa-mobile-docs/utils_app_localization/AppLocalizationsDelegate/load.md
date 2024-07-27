


# load method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[AppLocalizations](../../utils_app_localization/AppLocalizations-class.md)> load
([Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html) locale)

_<span class="feature">override</span>_



<p>Start loading the resources for <code>locale</code>. The returned future completes
when the resources have finished loading.</p>
<p>It's assumed that this method will return an object that contains a
collection of related string resources (typically defined with one method
per resource). The object will be retrieved with <a href="https://api.flutter.dev/flutter/widgets/Localizations/of.html">Localizations.of</a>.</p>



## Implementation

```dart
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







