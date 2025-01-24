




userLanguageQuery method - AppLanguage class - lang\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/lang\_view\_model.dart](../../view_model_lang_view_model/view_model_lang_view_model-library.html)
3. [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4. userLanguageQuery method

userLanguageQuery


dark\_mode

light\_mode




# userLanguageQuery method


Future<void>
userLanguageQuery(

1. String userId

)

This function perform graphQL query to check the user's language in the database.

The function uses `gqlAuthQuery` method provided by Database Functions Services.

**params**:

* `userId`: user for which language need to be fetch.

**returns**:
None


## Implementation

```
Future<void> userLanguageQuery(String userId) async {
  try {
    await databaseFunctions.gqlAuthQuery(queries.newUserLanguage(userId));
  } catch (e) {
    print(e);
  }
}
```

 


1. [talawa](../../index.html)
2. [lang\_view\_model](../../view_model_lang_view_model/view_model_lang_view_model-library.html)
3. [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4. userLanguageQuery method

##### AppLanguage class





talawa
1.0.0+1






