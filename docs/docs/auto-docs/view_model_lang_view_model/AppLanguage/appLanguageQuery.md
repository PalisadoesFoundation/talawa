
<div>

# appLanguageQuery method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Queries the app language.

Performs graphQL query to check the app language. The function uses
`gqlAuthQuery` method provided by Database Functions Services.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  try {
    await databaseFunctions.gqlAuthQuery(queries.);
  } catch (e) {
    print(e);
  }
}
```







1.  [talawa](../../index.md)
2.  [lang_view_model](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.md)
4.  appLanguageQuery method

##### AppLanguage class







