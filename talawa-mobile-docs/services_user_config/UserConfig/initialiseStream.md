


# initialiseStream method








void initialiseStream
()








## Implementation

```dart
void initialiseStream() {
  _currentOrgInfoStream =
      _currentOrgInfoController.stream.asBroadcastStream();
}
```







