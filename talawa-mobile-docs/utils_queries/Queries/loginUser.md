


# loginUser method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) loginUser
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) email, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) password)








## Implementation

```dart
String loginUser(String email, String password) {
  return """
      mutation {
        login(data: {email: "$email", password: "$password"}){
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
          androidFirebaseOptions {
            apiKey
            appId
            messagingSenderId
            projectId
            storageBucket
          }
          iosFirebaseOptions {
            apiKey
            appId
            messagingSenderId
            projectId
            storageBucket
            iosClientId
            iosBundleId
          }
        }
      }
  """;
}
```







