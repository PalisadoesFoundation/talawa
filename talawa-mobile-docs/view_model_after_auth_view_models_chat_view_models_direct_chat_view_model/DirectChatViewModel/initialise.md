


# initialise method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> initialise
()








## Implementation

```dart
Future<void> initialise() async {
  setState(ViewState.busy);
  chatState = ChatState.loading;

  _chatListSubscription = _chatService.chatListStream.listen((newChat) {
    _uniqueChatIds.add(newChat.id!);
    _chats.insert(0, newChat);
  });

  await _chatService.getDirectChatsByUserId();

  chatState = ChatState.complete;
  setState(ViewState.idle);
}
```







