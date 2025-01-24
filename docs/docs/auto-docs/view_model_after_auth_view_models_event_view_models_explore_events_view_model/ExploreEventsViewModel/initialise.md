




initialise method - ExploreEventsViewModel class - explore\_events\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/explore\_events\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/view_model_after_auth_view_models_event_view_models_explore_events_view_model-library.html)
3. [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


Future<void>
initialise()

initialiser.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> initialise() async {
  setState(ViewState.busy);
  if (!demoMode) {
    _currentOrganizationStreamSubscription = userConfig.currentOrgInfoStream
        .listen((updatedOrganization) => refreshEvents());

    _eventStreamSubscription = _eventService.eventStream.listen(
      (newEvents) => checkIfExistsAndAddNewEvents(newEvents),
    );
    await _eventService.fetchEventsInitial();
    _bufferEvents = _events;
  }
  setState(ViewState.idle);
}
```

 


1. [talawa](../../index.html)
2. [explore\_events\_view\_model](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/view_model_after_auth_view_models_event_view_models_explore_events_view_model-library.html)
3. [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4. initialise method

##### ExploreEventsViewModel class





talawa
1.0.0+1






