




sendMessageToDirectChat method - ChatService class - chat\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/chat\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/)
3. [ChatService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService-class.html)
4. sendMessageToDirectChat method

sendMessageToDirectChat


dark\_mode

light\_mode




# sendMessageToDirectChat method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
sendMessageToDirectChat(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) chatId,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) messageContent

)

Sends a message to a direct chat.

**params**:

* `chatId`: The ID of the chat where the message will be sent.
* `messageContent`: The content of the message to be sent.

**returns**:
None


## Implementation

```
Future<void> sendMessageToDirectChat(
  String chatId,
  String messageContent,
) async {
  // trigger graphQL mutation to push the message in the Database.
  final result = await _dbFunctions.gqlAuthMutation(
    ChatQueries().sendMessageToDirectChat(),
    variables: {"chatId": chatId, "messageContent": messageContent},
  );

  final message = ChatMessage.fromJson(
    result.data?['sendMessageToDirectChat'] as Map<String, dynamic>,
  );

  _chatMessageController.add(message);

  debugPrint(result.data.toString());
}
```

 


1. [talawa](../../index.html)
2. [chat\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/)
3. [ChatService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService-class.html)
4. sendMessageToDirectChat method

##### ChatService class





talawa
1.0.0+1






