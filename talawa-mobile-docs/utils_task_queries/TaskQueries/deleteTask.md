


# deleteTask method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) deleteTask
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) taskId)








## Implementation

```dart
static String deleteTask(String taskId) => '''
  mutation {
    removeTask(id: "$taskId") {
      _id
    }
  }
''';
```







