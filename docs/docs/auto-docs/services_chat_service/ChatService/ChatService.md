


# ChatService constructor







ChatService()





## Implementation

```dart
ChatService() {
  _dbFunctions = locator<DataBaseMutationFunctions>();
  _chatListStream = _chatController.stream.asBroadcastStream();
  _chatMessagesStream = _chatMessageController.stream.asBroadcastStream();
}
```







