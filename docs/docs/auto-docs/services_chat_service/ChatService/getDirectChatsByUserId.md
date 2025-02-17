
<div>

# getDirectChatsByUserId method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Retrieves direct chats by user ID.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  final userId = _userConfig.currentUser.id;

  // trigger graphQL query to get all the chats
  // of the user using [userId].
  final String query = .fetchDirectChatsByUserId(userId!);

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







1.  [talawa](../../index.md)
2.  [chat_service](../../services_chat_service/)
3.  [ChatService](../../services_chat_service/ChatService-class.md)
4.  getDirectChatsByUserId method

##### ChatService class







