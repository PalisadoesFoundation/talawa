



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/)
3.  [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.md)
4.  checkIfExistsAndAddNewEvents method


checkIfExistsAndAddNewEvents


 dark_mode   light_mode 




<div>

# checkIfExistsAndAddNewEvents method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
checkIfExistsAndAddNewEvents(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[Event](../../models_events_event_model/Event-class.md)]\>]]
    newEvents]

)



This function add a new event if the event not exist.

**params**:

-   `newEvents`: `Event` type variable containing data to create a new
    event.

**returns**: None



## Implementation

``` language-dart
Future<void> checkIfExistsAndAddNewEvents(List<Event> newEvents) async 
```







1.  [talawa](../../index.md)
2.  [explore_events_view_model](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/)
3.  [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.md)
4.  checkIfExistsAndAddNewEvents method

##### ExploreEventsViewModel class









 talawa 1.0.0+1 
