




userLanguage method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. userLanguage method

userLanguage


dark\_mode

light\_mode




# userLanguage method


String
userLanguage()

query to fetch user lang.

**params**:
None

**returns**:

* `String`: query in string form, to be passed on to graphql client.

## Implementation

```
String userLanguage() {
  return '''
  query{
    myLanguage
  }
''';
}
```

 


1. [talawa](../../index.html)
2. [queries](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. userLanguage method

##### Queries class





talawa
1.0.0+1






