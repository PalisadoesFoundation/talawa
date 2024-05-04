


# sendMembershipRequest method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) sendMembershipRequest
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId)








## Implementation

```dart
String sendMembershipRequest(String orgId) {
  return '''
    mutation {
        sendMembershipRequest(organizationId: "$orgId"){
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
  }
''';
}
```







