


# choseValueFromDropdown method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> choseValueFromDropdown
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) value)





<p>This function takes the choosen value from dropdown and
return the filter events, if empty list then return relevant message.</p>
<p>params:</p>
<ul>
<li><code>value</code> : choosen value from dropdown.</li>
</ul>



## Implementation

```dart
Future<void> choseValueFromDropdown(String value) async {
  _chosenValue = value;
  notifyListeners();
  setState(ViewState.busy);

  switch (_chosenValue) {
    // if `_chosenValue` is "All events".
    case 'All Events':
      {
        // all events
        _events = _bufferEvents;
        // if list is empty
        _emptyListMessage = "Looks like there aren't any events.";
      }
      break;
    // if `_chosenValue` is "created event".
    case 'Created Events':
      {
        // loop through the `_events` list and check
        // for the creator id matched the current user id.
        _events = List.from(
          _bufferEvents.where(
            (element) => element.creator!.id == userConfig.currentUser.id,
          ),
        );
        // if list is empty
        _emptyListMessage = "You have not created any event.";
      }
      break;
    // if `_chosenValue` is "Registered Events".
    case 'Registered Events':
      {
        // loop through the `_events` list and filter elements
        // if `element.isRegistered` is true and user is not the creator.
        _events = List.from(
          _bufferEvents.where(
            (element) =>
                element.isRegistered == true &&
                element.creator!.id != userConfig.currentUser.id,
          ),
        );
        // if list is empty
        _emptyListMessage = "No registered events are present";
      }
      break;
    // if `_chosenValue` is "Registered Events".
    case 'Public Events':
      {
        // loop through the `_events` list and filter elements
        // with the `isPublic` as true.
        _events = _bufferEvents
            .where((element) => element.isPublic == true)
            .toList();

        // if list is empty
        _emptyListMessage = "There aren't any public events.";
      }
      break;
    case 'Private Events':
      {
        // loop through the `_events` list and filter elements
        // with the `isPublic` as false.
        _events = _bufferEvents
            .where((element) => element.isPublic == false)
            .toList();
        // if list is empty
        _emptyListMessage = "There aren't any private events.";
      }
      break;

    default:
      {
        _events = _bufferEvents;
      }
  }
  await Future.delayed(const Duration(milliseconds: 500));
  setState(ViewState.idle);
}
```







