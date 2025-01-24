




ChatService constructor - ChatService - chat\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/chat\_service.dart](../../services_chat_service/services_chat_service-library.html)
3. [ChatService](../../services_chat_service/ChatService-class.html)
4. ChatService constructor

ChatService


dark\_mode

light\_mode




# ChatService constructor


ChatService()

## Implementation

```
ChatService() {
  _dbFunctions = locator<DataBaseMutationFunctions>();
  _chatListStream = _chatController.stream.asBroadcastStream();
  _chatMessagesStream = _chatMessageController.stream.asBroadcastStream();
}
```

 


1. [talawa](../../index.html)
2. [chat\_service](../../services_chat_service/services_chat_service-library.html)
3. [ChatService](../../services_chat_service/ChatService-class.html)
4. ChatService constructor

##### ChatService class





talawa
1.0.0+1






