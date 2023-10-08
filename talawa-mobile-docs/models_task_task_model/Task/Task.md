


# Task constructor






const
Task({required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) id, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) title, required [User](../../models_user_user_info/User-class.md) creator, required [Event](../../models_events_event_model/Event-class.md) event, required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) createdAt, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? description, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? deadline})





## Implementation

```dart
const Task({
  required this.id,
  required this.title,
  required this.creator,
  required this.event,
  required this.createdAt,
  this.description,
  this.deadline,
});
```







