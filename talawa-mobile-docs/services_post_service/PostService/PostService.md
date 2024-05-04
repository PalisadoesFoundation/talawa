


# PostService constructor







PostService()





## Implementation

```dart
PostService() {
  _postStream = _postStreamController.stream.asBroadcastStream();
  _updatedPostStream =
      _updatedPostStreamController.stream.asBroadcastStream();
  _currentOrg = _userConfig.currentOrg;
  setOrgStreamSubscription();
  getPosts();
}
```







