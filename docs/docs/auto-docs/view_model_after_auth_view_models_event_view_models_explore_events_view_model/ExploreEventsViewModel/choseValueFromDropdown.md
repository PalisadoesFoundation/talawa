




choseValueFromDropdown method - ExploreEventsViewModel class - explore\_events\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/explore\_events\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/view_model_after_auth_view_models_event_view_models_explore_events_view_model-library.html)
3. [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4. choseValueFromDropdown method

choseValueFromDropdown


dark\_mode

light\_mode




# choseValueFromDropdown method


Future<void>
choseValueFromDropdown(

1. String value

)

This function takes the choosen value from dropdown and return the filter events, if empty list then return relevant message.

**params**:

* `value`: choosen value from dropdown.

**returns**:
None


## Implementation

```
Future<void> choseValueFromDropdown(String value) async {
  _chosenValue = value;
  notifyListeners();
  setState(ViewState.busy);

  if (!demoMode) {
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
      case 'My Events':
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
  }
  await Future.delayed(const Duration(milliseconds: 500));
  setState(ViewState.idle);
}
```

 


1. [talawa](../../index.html)
2. [explore\_events\_view\_model](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/view_model_after_auth_view_models_event_view_models_explore_events_view_model-library.html)
3. [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4. choseValueFromDropdown method

##### ExploreEventsViewModel class





talawa
1.0.0+1






