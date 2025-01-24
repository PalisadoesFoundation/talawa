




checkIfExistsAndAddNewEvents method - ExploreEventsViewModel class - explore\_events\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/explore\_events\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/view_model_after_auth_view_models_event_view_models_explore_events_view_model-library.html)
3. [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4. checkIfExistsAndAddNewEvents method

checkIfExistsAndAddNewEvents


dark\_mode

light\_mode




# checkIfExistsAndAddNewEvents method


Future<void>
checkIfExistsAndAddNewEvents(

1. List<[Event](../../models_events_event_model/Event-class.html)> newEvents

)

This function add a new event if the event not exist.

**params**:

* `newEvents`: `Event` type variable containing data to create a new event.

**returns**:
None


## Implementation

```
Future<void> checkIfExistsAndAddNewEvents(List<Event> newEvents) async {
  // Check if the event is unique and belongs to the current organization
  newEvents.forEach((newEvent) {
    if (!_uniqueEventIds.contains(newEvent.id) &&
        newEvent.organization!.id == userConfig.currentOrg.id) {
      _uniqueEventIds.add(newEvent.id!);
      _events.insert(0, newEvent);
    }
    if (!_userEvents.any((event) => event.id == newEvent.id) &&
        newEvent.creator!.id == userConfig.currentUser.id) {
      _userEvents.insert(0, newEvent);
    }
  });
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [explore\_events\_view\_model](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/view_model_after_auth_view_models_event_view_models_explore_events_view_model-library.html)
3. [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4. checkIfExistsAndAddNewEvents method

##### ExploreEventsViewModel class





talawa
1.0.0+1






