


# chatName method








void chatName
(dynamic chatId)








## Implementation

```dart
void chatName(chatId) {
  final List<ChatUser> users =
      _chats.firstWhere((element) => element.id == chatId).users!;

  users.forEach((element) {
    if (element.id != userConfig.currentUser.id!) {
      name = element.firstName;
    }
  });
}
```







