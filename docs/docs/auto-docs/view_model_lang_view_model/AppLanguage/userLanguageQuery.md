
<div>

# userLanguageQuery method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
userLanguageQuery(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
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
Future&lt;void&gt; userLanguageQuery(String userId) async 
```







1.  [talawa](../../index.md)
2.  [lang_view_model](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.md)
4.  userLanguageQuery method

##### AppLanguage class







