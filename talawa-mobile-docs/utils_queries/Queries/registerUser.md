


# registerUser method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) registerUser
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) firstName, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) lastName, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) email, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) password)








## Implementation

```dart
String registerUser(
  String firstName,
  String lastName,
  String email,
  String password,
) {
  return """
      mutation{
        signUp(data: {firstName: "$firstName", lastName: "$lastName", email: "$email", password: "$password"})
        {
          accessToken
          user{
              _id
              firstName
              lastName
              email
              image
              joinedOrganizations{
                _id
                name
                image
                description
                isPublic
                creator{
                  _id
                  firstName
                  lastName
                  image
                }
              }
              createdOrganizations{
                _id
                name
                image
                description
                isPublic
                creator{
                  _id
                  firstName
                  lastName
                  image
                }
              }
              membershipRequests{
                organization{
                  _id
                  name
                  image
                  description
                  isPublic
                  creator{
                    _id
                    firstName
                    lastName
                    image
                  }
                }
              }
              adminFor{
                _id
              }
            }
            refreshToken
          }
      }
  """;
}
```







