




fetchLocale method - AppLanguage class - lang\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/lang\_view\_model.dart](../../view_model_lang_view_model/view_model_lang_view_model-library.html)
3. [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4. fetchLocale method

fetchLocale


dark\_mode

light\_mode




# fetchLocale method


Future<void>
fetchLocale()

This function fetch the language of the user's app.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> fetchLocale() async {
  final prefs = await SharedPreferences.getInstance();
  final String langCode = prefs.getString('language_code') ?? 'en';
  _appLocale = Locale(langCode);

  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [lang\_view\_model](../../view_model_lang_view_model/view_model_lang_view_model-library.html)
3. [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4. fetchLocale method

##### AppLanguage class





talawa
1.0.0+1






