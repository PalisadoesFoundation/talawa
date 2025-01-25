




getDirectChatMessagesByChatId method - ChatService class - chat\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/chat\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/)
3. [ChatService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService-class.html)
4. getDirectChatMessagesByChatId method

getDirectChatMessagesByChatId


dark\_mode

light\_mode




# getDirectChatMessagesByChatId method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
getDirectChatMessagesByChatId(

1. dynamic chatId

)

This function retrieves direct chat messages by chat ID.

**params**:

* `chatId`: The ID of the chat for which messages
  are to be retrieved.

**returns**:
None


## Implementation

```
Future<void> getDirectChatMessagesByChatId(chatId) async {
  // trigger graphQL query to get all the chat messages
  // of a particular chat using [chatId].
  final String query =
      ChatQueries().fetchDirectChatMessagesByChatId(chatId as String);

  final result = await _dbFunctions.gqlAuthQuery(query);

  final messages = result.data?['directChatsMessagesByChatID'] as List;

  messages.forEach((message) {
    final chatMessage = ChatMessage.fromJson(message as Map<String, dynamic>);
    _chatMessageController.add(chatMessage);
  });
}
```

 


1. [talawa](../../index.html)
2. [chat\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/)
3. [ChatService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService-class.html)
4. getDirectChatMessagesByChatId method

##### ChatService class





talawa
1.0.0+1






