




newUserLanguage method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. newUserLanguage method

newUserLanguage


dark\_mode

light\_mode




# newUserLanguage method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
newUserLanguage(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) userId

)

query for new user language .

**params**:

* `userId`: user identifier

**returns**:

* `String`: query in string form, to be passed on to graphql client.

## Implementation

```
String newUserLanguage(String userId) {
  return '''
  query{
    userLanguage(userId:"$userId")
  }
''';
}
```

 


1. [talawa](../../index.html)
2. [queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/)
3. [Queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_queries/Queries-class.html)
4. newUserLanguage method

##### Queries class





talawa
1.0.0+1






