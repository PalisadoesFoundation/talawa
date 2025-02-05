


# fetchOrgDetailsById method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) fetchOrgDetailsById
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId)








## Implementation

```dart
String fetchOrgDetailsById(String orgId) {
  return '''
  query{
    organizations(id: "$orgId"){
      image
      _id
      name
      admins{
        _id
      }
      description
      isPublic
      creator{
        _id
        firstName
        lastName
      }
      members{
        _id
        firstName
        lastName
        image
      }
    }
  }
''';
}
```







