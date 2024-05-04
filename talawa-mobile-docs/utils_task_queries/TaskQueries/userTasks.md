


# userTasks method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) userTasks
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) userId)








## Implementation

```dart
static String userTasks(String userId) => '''
  query {
    tasksByUser(id: "$userId") {
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







