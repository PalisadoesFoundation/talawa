




changeLanguage method - AppLanguage class - lang\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/lang\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/)
3. [AppLanguage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage-class.html)
4. changeLanguage method

changeLanguage


dark\_mode

light\_mode




# changeLanguage method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
changeLanguage(

1. dynamic type

)

This function change the app default language.

**params**:

* `type`: `Locale` type, the language need to be updated with.

**returns**:
None


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [lang\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/)
3. [AppLanguage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage-class.html)
4. changeLanguage method

##### AppLanguage class





talawa
1.0.0+1






