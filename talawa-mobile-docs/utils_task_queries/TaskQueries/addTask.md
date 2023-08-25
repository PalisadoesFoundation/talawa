


# addTask method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) addTask
({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) title, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) description, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deadline, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId})








## Implementation

```dart
static String addTask({
  required String title,
  required String description,
  required String deadline,
  required String eventId,
}) =>
    '''
      mutation {
        createTask(
          data: { title: "$title", description: "$description", deadline: "$deadline" }
          eventId: "$eventId"
        ) {
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







