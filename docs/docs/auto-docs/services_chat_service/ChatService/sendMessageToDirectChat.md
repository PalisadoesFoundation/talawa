
<div>

# sendMessageToDirectChat method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
sendMessageToDirectChat(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    chatId, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    messageContent]

)



Sends a message to a direct chat.

**params**:

-   `chatId`: The ID of the chat where the message will be sent.
-   `messageContent`: The content of the message to be sent.

**returns**: None



## Implementation

``` language-dart
Future<void> sendMessageToDirectChat(
  String chatId,
  String messageContent,
) async {
  // trigger graphQL mutation to push the message in the Database.
  final result = await _dbFunctions.gqlAuthMutation(
    .,
    variables: {"chatId": chatId, "messageContent": messageContent},
  );

  final message = ChatMessage.fromJson(
    result.data?['sendMessageToDirectChat'] as Map<String, dynamic>,
  );

  _chatMessageController.add(message);

  debugPrint(result.data.);
}
```







1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  sendMessageToDirectChat method

##### ChatService class







