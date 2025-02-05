


# registrantsByEvent method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) registrantsByEvent
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)








## Implementation

```dart
String registrantsByEvent(String eventId) {
  return '''
    query {
      registrantsByEvent(id: "$eventId") {
        _id
        firstName
        lastName
        image
      }
    }
  ''';
}
```







