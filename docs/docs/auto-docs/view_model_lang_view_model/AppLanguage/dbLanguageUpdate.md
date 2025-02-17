
<div>

# dbLanguageUpdate method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




This function updates the Database Language by running the graphQL
`mutations`.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  try {
    await databaseFunctions
        .gqlAuthMutation(queries.updateLanguage(_appLocale.languageCode));
    print('Language Updated in Database');
  } catch (e) {
    print(e);
  }
}
```







1.  [talawa](../../index.md)
2.  [lang_view_model](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.md)
4.  dbLanguageUpdate method

##### AppLanguage class







