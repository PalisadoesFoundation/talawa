


# editTask method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) editTask
({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) title, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) description, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deadline, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) taskId})








## Implementation

```dart
static String editTask({
  required String title,
  required String description,
  required String deadline,
  required String taskId,
}) =>
    '''
      mutation {
        updateTask(
          data: { title: "$title", description: "$description", deadline: "$deadline" }
          id: "$taskId"
        ) {
          _id
          title
          description
          createdAt
          deadline
          creator {
            _id
          }
          event {
            _id
          }
        }
      }
    ''';
```







