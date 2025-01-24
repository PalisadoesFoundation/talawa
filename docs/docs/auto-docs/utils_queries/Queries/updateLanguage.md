




updateLanguage method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. updateLanguage method

updateLanguage


dark\_mode

light\_mode




# updateLanguage method


String
updateLanguage(

1. String languageCode

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
2. [queries](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. updateLanguage method

##### Queries class





talawa
1.0.0+1






