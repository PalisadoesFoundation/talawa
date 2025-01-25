




updateLanguage method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. updateLanguage method

updateLanguage


dark\_mode

light\_mode




# updateLanguage method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
updateLanguage(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) languageCode

)

lang update mutation.

**params**:

* `languageCode`: lang code to identify the lang, refer lang jsons

**returns**:

* `String`: mutation in string form, to be passed on to graphql client.

## Implementation

```
String updateLanguage(String languageCode) {
  return '''
      mutation {
        updateLanguage(languageCode: "$languageCode"){
          _id
          firstName
          appLanguageCode
        }
      }
  ''';
}
```

 


1. [talawa](../../index.html)
2. [queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. updateLanguage method

##### Queries class





talawa
1.0.0+1






