


# sendMessageToDirectChat method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) sendMessageToDirectChat
()








## Implementation

```dart
String sendMessageToDirectChat() {
  return '''
    mutation sendMessageToDirectChat(
      \$chatId: ID!
      \$messageContent: String!
      ){
      sendMessageToDirectChat(
        chatId: \$chatId
        messageContent: \$messageContent
      ) {
        messageContent
          sender{
            firstName
          }
          receiver{
            firstName
          }
        }
      }
  ''';
}
```







