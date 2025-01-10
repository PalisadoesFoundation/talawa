


# changeLanguage method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> changeLanguage
([Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html) type)





<p>This function change the app default language.</p>
<p>params:</p>
<ul>
<li><code>type</code> : <code>Locale</code> type, the language need to be updated with.</li>
</ul>



## Implementation

```dart
Future<void> changeLanguage(Locale type) async {
  // if the app language is of same [type].
  if (_appLocale == type) {
    return;
  }

  if (isTest) {
    _appLocale = type;
  } else {
    final prefs = await SharedPreferences.getInstance();
    if (type == const Locale("es")) {
      //If selected language is spanish
      _appLocale = const Locale("es");
      await prefs.setString('language_code', 'es');
      await prefs.setString('countryCode', 'ES');
    } else if (type == const Locale("fr")) {
      //If selected language is french
      _appLocale = const Locale("fr");
      await prefs.setString('language_code', 'fr');
      await prefs.setString('countryCode', 'FR');
    } else if (type == const Locale("hi")) {
      //If selected language is hindi
      _appLocale = const Locale("hi");
      await prefs.setString('language_code', 'hi');
      await prefs.setString('countryCode', 'IN');
    } else if (type == const Locale("zh")) {
      //If selected language is Chinese
      _appLocale = const Locale("zh");
      await prefs.setString('language_code', 'zh');
      await prefs.setString('countryCode', 'CN');
    } else if (type == const Locale("de")) {
      //If selected language is Chinese
      _appLocale = const Locale("de");
      await prefs.setString('language_code', 'de');
      await prefs.setString('countryCode', 'GE');
    } else if (type == const Locale("ja")) {
      //If selected language is Chinese
      _appLocale = const Locale("ja");
      await prefs.setString('language_code', 'ja');
      await prefs.setString('countryCode', 'JP');
    } else if (type == const Locale("pt")) {
      //If selected language is Chinese
      _appLocale = const Locale("pt");
      await prefs.setString('language_code', 'pt');
      await prefs.setString('countryCode', 'PT');
    } else {
      //If selected language is english
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
  }

  /// notifying the consumers
  notifyListeners();
}
```







