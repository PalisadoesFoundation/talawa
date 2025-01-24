




fetchNewEvents method - ExploreEventsViewModel class - explore\_events\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/explore\_events\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/view_model_after_auth_view_models_event_view_models_explore_events_view_model-library.html)
3. [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4. fetchNewEvents method

fetchNewEvents


dark\_mode

light\_mode




# fetchNewEvents method


Future<void>
fetchNewEvents()

This function is used to fetch new events in the organization.

The function uses `getEvents` method from `EventService`.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> fetchNewEvents() async {
  setState(ViewState.busy);
  notifyListeners();
  await _eventService.getEvents();
  setState(ViewState.idle);
}
```

 


1. [talawa](../../index.html)
2. [explore\_events\_view\_model](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/view_model_after_auth_view_models_event_view_models_explore_events_view_model-library.html)
3. [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4. fetchNewEvents method

##### ExploreEventsViewModel class





talawa
1.0.0+1






