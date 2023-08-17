


# fetchUserInfo property







[String](https://api.flutter.dev/flutter/dart-core/String-class.html) fetchUserInfo
  
_<span class="feature">read / write</span>_






## Implementation

```dart
String fetchUserInfo = '''
     query Users(\$id: ID!){
        users(where: { id: \$id }) {
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
      }
  ''';
```







