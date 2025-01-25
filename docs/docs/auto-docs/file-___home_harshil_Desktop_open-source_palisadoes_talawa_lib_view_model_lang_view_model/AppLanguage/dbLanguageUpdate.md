




dbLanguageUpdate method - AppLanguage class - lang\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/lang\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/)
3. [AppLanguage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage-class.html)
4. dbLanguageUpdate method

dbLanguageUpdate


dark\_mode

light\_mode




# dbLanguageUpdate method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
dbLanguageUpdate()

This function updates the Database Language by running the graphQL `mutations`.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> dbLanguageUpdate() async {
  try {
    await databaseFunctions
        .gqlAuthMutation(queries.updateLanguage(_appLocale.languageCode));
    print('Language Updated in Database');
  } catch (e) {
    print(e);
  }
}
```

 


1. [talawa](../../index.html)
2. [lang\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/)
3. [AppLanguage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage-class.html)
4. dbLanguageUpdate method

##### AppLanguage class





talawa
1.0.0+1






