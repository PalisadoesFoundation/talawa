
<div>

# newUserLanguage method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
newUserLanguage(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    userId]

)



query for new user language .

**params**:

-   `userId`: user identifier

**returns**:

-   `String`: query in string form, to be passed on to graphql client.



## Implementation

``` language-dart
String newUserLanguage(String userId) {
  return '''
  query{
    userLanguage(userId:"$userId")
  }
''';
}
```







1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  newUserLanguage method

##### Queries class







