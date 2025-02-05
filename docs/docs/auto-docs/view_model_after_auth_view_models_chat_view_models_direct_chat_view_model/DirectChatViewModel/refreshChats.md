


# refreshChats method








void refreshChats
()





<p>This function refresh the chats.</p>



## Implementation

```dart
void refreshChats() {
  _chats.clear();
  _uniqueChatIds.clear();
  notifyListeners();
  _chatService.getDirectChatsByUserId();
}
```







