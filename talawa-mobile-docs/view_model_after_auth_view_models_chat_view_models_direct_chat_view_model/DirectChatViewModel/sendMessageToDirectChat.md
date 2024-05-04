


# sendMessageToDirectChat method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> sendMessageToDirectChat
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) chatId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) messageContent)





<p>This function send the message to Direct Chat.</p>
<p>params:</p>
<ul>
<li><code>chatId</code> : id of a chat where message need to be send.</li>
<li><code>messageContent</code> : content of a message.</li>
</ul>



## Implementation

```dart
Future<void> sendMessageToDirectChat(
  String chatId,
  String messageContent,
) async {
  chatState = ChatState.loading;
  _chatService.chatMessagesStream.listen((newMessage) {
    _chatMessagesByUser[chatId]!.add(newMessage);
  });
  await _chatService.sendMessageToDirectChat(chatId, messageContent);
  chatState = ChatState.complete;
}
```







