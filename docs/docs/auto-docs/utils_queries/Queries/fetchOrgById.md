


# fetchOrgById method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) fetchOrgById
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId)








## Implementation

```dart
String fetchOrgById(String orgId) {
  return '''
  query{
    organizations(id: "$orgId"){
      image
      _id
      name
      image
      isPublic
      creator{
        firstName
        lastName
      }
    }
  }
''';
}
```







