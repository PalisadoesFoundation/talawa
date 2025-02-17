
<div>

# registerUser method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
registerUser(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    firstName, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    lastName, ]
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    email, ]
4.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    password, ]
5.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
    selectedOrganization,
    ]

)



Mutation to register a user.

**params**:

-   `firstName`: user\'s data.
-   `lastName`: user\'s data.
-   `email`: user\'s data.
-   `password`: user\'s data.
-   `selectedOrganization`: ID of the selected organization.

**returns**:

-   `String`: Return the mutation in string type to be passed to graphql
    client.



## Implementation

``` language-dart
String registerUser(
  String firstName,
  String lastName,
  String email,
  String password,
  String? selectedOrganization,
) {
  return """
          mutation {
            signUp(input: {
              emailAddress: "$email"
              name: "$firstName $lastName"
              password: "$password"

            }) {
              authenticationToken,
              user{
                id
                name,
                avatarURL,
                emailAddress,

              }

            }
          }
  """;
}
```







1.  [talawa](../../index.html)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  registerUser method

##### Queries class







