




fetchDirectChatMessagesByChatId method - ChatQueries class - chat\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/chat\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_chat_queries/)
3. [ChatQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_chat_queries/ChatQueries-class.html)
4. fetchDirectChatMessagesByChatId method

fetchDirectChatMessagesByChatId


dark\_mode

light\_mode




# fetchDirectChatMessagesByChatId method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
fetchDirectChatMessagesByChatId(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) chatId

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
2. [chat\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_chat_queries/)
3. [ChatQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_chat_queries/ChatQueries-class.html)
4. fetchDirectChatMessagesByChatId method

##### ChatQueries class





talawa
1.0.0+1






