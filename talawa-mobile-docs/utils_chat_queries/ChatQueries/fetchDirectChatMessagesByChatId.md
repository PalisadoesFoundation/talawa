


# fetchDirectChatMessagesByChatId method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) fetchDirectChatMessagesByChatId
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) chatId)








## Implementation

```dart
String fetchDirectChatMessagesByChatId(String chatId) {
  return '''
      query {
        directChatsMessagesByChatID(id: "$chatId") {
          _id
          messageContent
          sender {
            _id
            firstName
            image
          }
          receiver {
            _id
            firstName
            image
          }
        }
      }
  ''';
}
```







