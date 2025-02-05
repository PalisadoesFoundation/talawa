


# fetchNewEvents method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> fetchNewEvents
()





<p>This function is used to fetch new events in the organization.
The function uses <code>getEvents</code> method from <code>EventService</code>.</p>



## Implementation

```dart
Future<void> fetchNewEvents() async {
  setState(ViewState.busy);
  notifyListeners();
  await _eventService.getEvents();
  setState(ViewState.idle);
}
```







