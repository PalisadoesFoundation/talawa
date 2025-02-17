
<div>

# userLanguageQuery method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
userLanguageQuery(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    userId]

)



This function perform graphQL query to check the user\'s language in the
database.

The function uses `gqlAuthQuery` method provided by Database Functions
Services.

**params**:

-   `userId`: user for which language need to be fetch.

**returns**: None



## Implementation

``` language-dart
Future<void> userLanguageQuery(String userId) async {
  try {
    await databaseFunctions.gqlAuthQuery(queries.newUserLanguage(userId));
  } catch (e) {
    print(e);
  }
}
```







1.  [talawa](../../index.html)
2.  [lang_view_model](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4.  userLanguageQuery method

##### AppLanguage class







