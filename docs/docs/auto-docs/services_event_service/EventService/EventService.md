


# EventService constructor







EventService()





## Implementation

```dart
EventService() \{
  _eventStream = _eventStreamController.stream.asBroadcastStream();
  _currentOrg = _userConfig.currentOrg;
  _userConfig.initialiseStream();
  setOrgStreamSubscription();
\}
```







