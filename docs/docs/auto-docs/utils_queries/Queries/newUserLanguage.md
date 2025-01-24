




newUserLanguage method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. newUserLanguage method

newUserLanguage


dark\_mode

light\_mode




# newUserLanguage method


String
newUserLanguage(

1. String userId

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
2. [queries](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. newUserLanguage method

##### Queries class





talawa
1.0.0+1






