


# deleteEvent method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) deleteEvent
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) id)








## Implementation

```dart
String deleteEvent(String id) {
  return """
    mutation {
      removeEvent(
        id: "$id",
        ){
          _id
        }
      }
  """;
}
```







