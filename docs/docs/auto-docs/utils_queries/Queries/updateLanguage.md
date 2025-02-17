
<div>

# updateLanguage method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
updateLanguage(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    languageCode]

)



lang update mutation.

**params**:

-   `languageCode`: lang code to identify the lang, refer lang jsons

**returns**:

-   `String`: mutation in string form, to be passed on to graphql
    client.



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  updateLanguage method

##### Queries class







