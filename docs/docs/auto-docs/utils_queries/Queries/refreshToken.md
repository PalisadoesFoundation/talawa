
<div>

# refreshToken method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
refreshToken(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    refreshToken]

)



mutation for refresh token.

**params**:

-   `refreshToken`: related to auth, token based authentication,
    mutation to refresh the token

**returns**:

-   `String`: mutation in string form, to be passed on to graphql
    client.



## Implementation

``` language-dart
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







1.  [talawa](../../index.html)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  refreshToken method

##### Queries class







