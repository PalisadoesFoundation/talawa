


# joinOrgById method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) joinOrgById
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId)








## Implementation

```dart
String joinOrgById(String orgId) {
  return '''
  mutation {
    joinPublicOrganization(organizationId: "$orgId") {
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
    }
	}
''';
}
```







