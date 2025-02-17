
<div>

# loginUser method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
loginUser(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    email, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    password]

)



mutation to login the user.

**params**:

-   `email`: user\'s data
-   `password`: user\'s data

**returns**:

-   `String`: mutation in string form, to be passed on to graphql
    client.



## Implementation

``` language-dart
String loginUser(String email, String password) {
  return """
    query {
    signIn(input: { emailAddress: "$email", password: "$password" }) {
      authenticationToken,
      user {
        id,
        name,
        emailAddress,
        name,
        avatarURL,
      }
    }
  }
  """;
}
```







1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  loginUser method

##### Queries class







