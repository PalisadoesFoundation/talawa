
<div>

# initialise method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




initialiser.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  setState(ViewState.busy);
  if (!demoMode) {
    _currentOrganizationStreamSubscription = userConfig.currentOrgInfoStream
        .listen((updatedOrganization) => );

    _eventStreamSubscription = _eventService.eventStream.listen(
      (newEvents) => checkIfExistsAndAddNewEvents(newEvents),
    );
    await _eventService.;
    _bufferEvents = _events;
  }
  setState(ViewState.idle);
}
```







1.  [talawa](../../index.html)
2.  [explore_events_view_model](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/)
3.  [ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)
4.  initialise method

##### ExploreEventsViewModel class







