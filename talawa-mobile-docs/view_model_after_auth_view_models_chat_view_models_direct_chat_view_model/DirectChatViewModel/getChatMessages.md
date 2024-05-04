


# getChatMessages method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getChatMessages
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) chatId)





<p>This function get all messages for a chat.</p>
<p>params:</p>
<ul>
<li><code>chatId</code> : id of a chat for which messages need to be fetched.</li>
</ul>



## Implementation

```dart
Future<void> getChatMessages(String chatId) async {
  _chatMessagesByUser.clear();
  chatState = ChatState.loading;
  // await _chatService.getMessagesFromDirectChat();
  // variable
  final List<ChatMessage> messages = [];
  _chatMessageSubscription =
      _chatService.chatMessagesStream.listen((newMessage) {
    messages.add(newMessage);
    _chatMessagesByUser[chatId] = messages;
  });
  // use `chatService` services
  await _chatService.getDirectChatMessagesByChatId(chatId);
  chatState = ChatState.complete;
  notifyListeners();
}
```







