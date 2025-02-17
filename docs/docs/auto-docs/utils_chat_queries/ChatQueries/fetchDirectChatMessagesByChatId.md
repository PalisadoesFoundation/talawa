
<div>

# fetchDirectChatMessagesByChatId method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
fetchDirectChatMessagesByChatId(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId]

)



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [chat_queries](../../utils_chat_queries/)
3.  [ChatQueries](../../utils_chat_queries/ChatQueries-class.md)
4.  fetchDirectChatMessagesByChatId method

##### ChatQueries class







