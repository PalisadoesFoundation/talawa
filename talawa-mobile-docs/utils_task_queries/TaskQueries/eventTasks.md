


# eventTasks method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventTasks
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId)








## Implementation

```dart
static String eventTasks(String eventId) => '''
  query {
    tasksByEvent(id: "$eventId") {
      _id
      title
      description
      createdAt
      deadline
      creator {
        _id
        firstName
      }
      event {
        _id
        title
      }
    }
  }
''';
```







