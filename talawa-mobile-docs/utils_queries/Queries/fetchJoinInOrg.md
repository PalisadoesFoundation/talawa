


# fetchJoinInOrg property









[String](https://api.flutter.dev/flutter/dart-core/String-class.html) fetchJoinInOrg
  







## Implementation

```dart
String get fetchJoinInOrg {
  return """
  query organizationsConnection(\$first: Int, \$skip: Int){
    organizationsConnection(
      first: \$first,
      skip: \$skip,
      orderBy: name_ASC
    ){
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
""";
}
```








