




fetchDirectChatMessagesByChatId method - ChatQueries class - chat\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/chat\_queries.dart](../../utils_chat_queries/utils_chat_queries-library.html)
3. [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4. fetchDirectChatMessagesByChatId method

fetchDirectChatMessagesByChatId


dark\_mode

light\_mode




# fetchDirectChatMessagesByChatId method


String
fetchDirectChatMessagesByChatId(

1. String chatId

)

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [chat\_queries](../../utils_chat_queries/utils_chat_queries-library.html)
3. [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4. fetchDirectChatMessagesByChatId method

##### ChatQueries class





talawa
1.0.0+1






