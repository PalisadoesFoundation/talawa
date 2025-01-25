




appLanguageQuery method - AppLanguage class - lang\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/lang\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/)
3. [AppLanguage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage-class.html)
4. appLanguageQuery method

appLanguageQuery


dark\_mode

light\_mode




# appLanguageQuery method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
appLanguageQuery()

Queries the app language.

Performs graphQL query to check the app language.
The function uses `gqlAuthQuery` method provided by Database
Functions Services.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> appLanguageQuery() async {
  try {
    await databaseFunctions.gqlAuthQuery(queries.userLanguage());
  } catch (e) {
    print(e);
  }
}
```

 


1. [talawa](../../index.html)
2. [lang\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/)
3. [AppLanguage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_lang_view_model/AppLanguage-class.html)
4. appLanguageQuery method

##### AppLanguage class





talawa
1.0.0+1






