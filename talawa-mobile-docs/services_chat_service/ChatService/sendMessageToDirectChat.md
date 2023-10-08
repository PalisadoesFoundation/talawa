


# sendMessageToDirectChat method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> sendMessageToDirectChat
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) chatId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) messageContent)





<p>This function is used to send the message in the direct chats.</p>
<p>parameters required:</p>
<ul>
<li><code>chatId</code> - id of the direct chat where message need to be send.</li>
<li><code>messageContent</code> - the text that need to be send.</li>
</ul>



## Implementation

```dart
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
    result.data['sendMessageToDirectChat'] as Map<String, dynamic>,
  );

  _chatMessageController.add(message);

  debugPrint(result.data.toString());
}
```







