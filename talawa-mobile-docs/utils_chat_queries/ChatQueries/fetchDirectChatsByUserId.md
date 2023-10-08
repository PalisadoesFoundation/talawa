


# fetchDirectChatsByUserId method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) fetchDirectChatsByUserId
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) userId)








## Implementation

```dart
String fetchDirectChatsByUserId(String userId) {
  return '''
    query {
    directChatsByUserID(id: "$userId") {
      _id
      users{
        _id
        firstName
        email
      }
    }
  }
 ''';
}
```







