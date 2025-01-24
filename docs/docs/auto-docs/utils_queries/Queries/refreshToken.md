




refreshToken method - Queries class - queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/queries.dart](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. refreshToken method

refreshToken


dark\_mode

light\_mode




# refreshToken method


String
refreshToken(

1. String refreshToken

)

mutation for refresh token.

**params**:

* `refreshToken`: related to auth, token based authentication, mutation to refresh the token

**returns**:

* `String`: mutation in string form, to be passed on to graphql client.

## Implementation

```
String refreshToken(String refreshToken) {
  return '''
      mutation{
        refreshToken(refreshToken: "$refreshToken"){
          accessToken
          refreshToken
        }
      }
  ''';
}
```

 


1. [talawa](../../index.html)
2. [queries](../../utils_queries/utils_queries-library.html)
3. [Queries](../../utils_queries/Queries-class.html)
4. refreshToken method

##### Queries class





talawa
1.0.0+1






