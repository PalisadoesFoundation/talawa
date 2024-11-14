


# checkIfExistsAndAddNewEvent method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> checkIfExistsAndAddNewEvent
([Event](../../models_events_event_model/Event-class.md) newEvent)





<p>This function add a new event if the event not exist.</p>
<p>params:</p>
<ul>
<li><code>newEvent</code> : <code>Event</code> type variable containing data to create a new event.</li>
</ul>



## Implementation

```dart
Future<void> checkIfExistsAndAddNewEvent(Event newEvent) async {
  // checking if the `newEvent.id` is unique and not exist already.
  if ((!_uniqueEventIds.contains(newEvent.id)) &&
      (newEvent.organization!.id == userConfig.currentOrg.id)) {
    _uniqueEventIds.add(newEvent.id!);
    _parseEventDateTime(newEvent);
    notifyListeners();
  }
}
```







