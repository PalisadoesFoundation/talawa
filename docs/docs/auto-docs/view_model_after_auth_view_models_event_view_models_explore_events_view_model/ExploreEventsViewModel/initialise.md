


# initialise method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> initialise
()








## Implementation

```dart
Future<void> initialise() async {
  setState(ViewState.busy);
  _currentOrganizationStreamSubscription = userConfig.currentOrgInfoStream
      .listen((updatedOrganization) => refreshEvents());
  await _eventService.getEvents();

  _eventStreamSubscription = _eventService.eventStream.listen(
    (newEvent) => checkIfExistsAndAddNewEvent(newEvent),
  );
  _bufferEvents = _events;
  setState(ViewState.idle);
}
```







