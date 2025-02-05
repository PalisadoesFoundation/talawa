


# getDirectChatMessagesByChatId method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getDirectChatMessagesByChatId
(dynamic chatId)





<p>This function is used to get all the chat messages of a particular chat by the user.</p>
<p>parameters required:</p>
<ul>
<li><code>chatId</code> - id of the direct chat.</li>
</ul>



## Implementation

```dart
Future<void> getDirectChatMessagesByChatId(chatId) async {
  // trigger graphQL query to get all the chat messages of a particular chat using [chatId].
  final String query =
      ChatQueries().fetchDirectChatMessagesByChatId(chatId as String);

  final result = await _dbFunctions.gqlAuthQuery(query);

  final messages = result.data['directChatsMessagesByChatID'] as List;

  messages.forEach((message) {
    final chatMessage = ChatMessage.fromJson(message as Map<String, dynamic>);
    _chatMessageController.add(chatMessage);
  });
}
```







