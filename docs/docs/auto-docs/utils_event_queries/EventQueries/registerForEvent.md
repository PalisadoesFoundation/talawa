


# registerForEvent method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) registerForEvent
()








## Implementation

```dart
String registerForEvent() {
  return """
   mutation registerForEvent(\$eventId: ID!) {
    registerForEvent(id: \$eventId)
      {
      _id
      title
      description
    }
  }
""";
}
```







