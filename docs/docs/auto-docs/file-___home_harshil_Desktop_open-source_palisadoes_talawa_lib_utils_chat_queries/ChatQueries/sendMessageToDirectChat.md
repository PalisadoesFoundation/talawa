




sendMessageToDirectChat method - ChatQueries class - chat\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/chat\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_chat_queries/)
3. [ChatQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_chat_queries/ChatQueries-class.html)
4. sendMessageToDirectChat method

sendMessageToDirectChat


dark\_mode

light\_mode




# sendMessageToDirectChat method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
sendMessageToDirectChat()

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [chat\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_chat_queries/)
3. [ChatQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_chat_queries/ChatQueries-class.html)
4. sendMessageToDirectChat method

##### ChatQueries class





talawa
1.0.0+1






