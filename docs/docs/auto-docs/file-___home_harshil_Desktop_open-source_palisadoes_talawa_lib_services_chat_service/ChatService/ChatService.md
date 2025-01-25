




ChatService constructor - ChatService - chat\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/chat\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/)
3. [ChatService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService-class.html)
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
2. [chat\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/)
3. [ChatService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_chat_service/ChatService-class.html)
4. ChatService constructor

##### ChatService class





talawa
1.0.0+1






