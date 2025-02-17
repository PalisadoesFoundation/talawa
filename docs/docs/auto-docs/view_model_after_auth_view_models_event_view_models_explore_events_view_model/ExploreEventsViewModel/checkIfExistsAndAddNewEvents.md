
<div>

# checkIfExistsAndAddNewEvents method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
checkIfExistsAndAddNewEvents(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Event](../../models_events_event_model/Event-class.html)]\>]]
    newEvents]

)



This function add a new event if the event not exist.

**params**:

-   `newEvents`: `Event` type variable containing data to create a new
    event.

**returns**: None



## Implementation

``` language-dart
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
  ;
}
```







1.  [talawa](../../index.html)
2.  [explore_events_view_model](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/)
3.  [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4.  checkIfExistsAndAddNewEvents method

##### ExploreEventsViewModel class







