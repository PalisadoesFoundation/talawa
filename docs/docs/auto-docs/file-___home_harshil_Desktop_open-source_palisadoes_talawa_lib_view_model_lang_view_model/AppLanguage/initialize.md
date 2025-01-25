




initialize method - AppLanguage class - lang\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/lang\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/)
3. [AppLanguage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
initialize()

initialiser.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> initialize() async {
  _appLocale = const Locale('en');
  await fetchLocale();
}
```

 


1. [talawa](../../index.html)
2. [lang\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/)
3. [AppLanguage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage-class.html)
4. initialize method

##### AppLanguage class





talawa
1.0.0+1






