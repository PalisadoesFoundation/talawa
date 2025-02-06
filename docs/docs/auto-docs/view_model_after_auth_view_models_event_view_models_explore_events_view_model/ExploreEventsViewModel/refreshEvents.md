


# refreshEvents method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> refreshEvents
()





<p>This function is used to refresh the events in the organization.
The function uses ```dartgetEvents``` method from ```dartEventService```.</p>



## Implementation

```dart
Future<void> refreshEvents() async \{
  setState(ViewState.busy);
  _events.clear();
  _uniqueEventIds.clear();
  await _eventService.getEvents();
  setState(ViewState.idle);
\}
```







