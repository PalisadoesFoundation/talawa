




sendMessageToDirectChat method - ChatQueries class - chat\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/chat\_queries.dart](../../utils_chat_queries/utils_chat_queries-library.html)
3. [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4. sendMessageToDirectChat method

sendMessageToDirectChat


dark\_mode

light\_mode




# sendMessageToDirectChat method


String
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
2. [chat\_queries](../../utils_chat_queries/utils_chat_queries-library.html)
3. [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4. sendMessageToDirectChat method

##### ChatQueries class





talawa
1.0.0+1






