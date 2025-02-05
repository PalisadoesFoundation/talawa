


# fetchJoinInOrgByName property









[String](https://api.flutter.dev/flutter/dart-core/String-class.html) fetchJoinInOrgByName
  







## Implementation

```dart
String get fetchJoinInOrgByName {
  return """
  query organizationsConnection(
    \$first: Int,
    \$skip: Int,
    \$nameStartsWith: String
  ){
    organizationsConnection(
      where:{
        name_starts_with: \$nameStartsWith,
        visibleInSearch: true,
        isPublic: true,
      }
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








