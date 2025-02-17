
<div>

# sendMessageToDirectChat method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




## Implementation

``` language-dart
String  {
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







1.  [talawa](../../index.html)
2.  [chat_queries](../../utils_chat_queries/)
3.  [ChatQueries](../../utils_chat_queries/ChatQueries-class.html)
4.  sendMessageToDirectChat method

##### ChatQueries class







