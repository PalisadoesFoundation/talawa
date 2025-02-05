


# getDirectChatsByUserId method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getDirectChatsByUserId
()





<p>This function is used to get all the chats by the user.</p>
<p>parameters required:</p>
<ul>
<li><code>usedId</code> - current user id, to get all the direct chats associated with this id.</li>
</ul>



## Implementation

```dart
Future<void> getDirectChatsByUserId() async {
  final userId = _userConfig.currentUser.id;

  // trigger graphQL query to get all the chats of the user using [userId].
  final String query = ChatQueries().fetchDirectChatsByUserId(userId!);

  final result = await _dbFunctions.gqlAuthQuery(query);

  final directMessageList = result.data['directChatsByUserID'] as List;

  // loop through the result [directMessageList] and append the element to the directChat.
  directMessageList.forEach((chat) {
    final directChat =
        ChatListTileDataModel.fromJson(chat as Map<String, dynamic>);

    directChat.users!.forEach((element) {
      if (element.id != userId) _chatController.add(directChat);
    });
  });
}
```







