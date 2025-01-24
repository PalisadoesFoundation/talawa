




getDirectChatsByUserId method - ChatService class - chat\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/chat\_service.dart](../../services_chat_service/services_chat_service-library.html)
3. [ChatService](../../services_chat_service/ChatService-class.html)
4. getDirectChatsByUserId method

getDirectChatsByUserId


dark\_mode

light\_mode




# getDirectChatsByUserId method


Future<void>
getDirectChatsByUserId()

Retrieves direct chats by user ID.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> getDirectChatsByUserId() async {
  final userId = _userConfig.currentUser.id;

  // trigger graphQL query to get all the chats
  // of the user using [userId].
  final String query = ChatQueries().fetchDirectChatsByUserId(userId!);

  final result = await _dbFunctions.gqlAuthQuery(query);

  final directMessageList = result.data?['directChatsByUserID'] as List;

  // loop through the result [directMessageList]
  // and append the element to the directChat.
  directMessageList.forEach((chat) {
    final directChat =
        ChatListTileDataModel.fromJson(chat as Map<String, dynamic>);

    directChat.users!.forEach((element) {
      if (element.id != userId) _chatController.add(directChat);
    });
  });
}
```

 


1. [talawa](../../index.html)
2. [chat\_service](../../services_chat_service/services_chat_service-library.html)
3. [ChatService](../../services_chat_service/ChatService-class.html)
4. getDirectChatsByUserId method

##### ChatService class





talawa
1.0.0+1






