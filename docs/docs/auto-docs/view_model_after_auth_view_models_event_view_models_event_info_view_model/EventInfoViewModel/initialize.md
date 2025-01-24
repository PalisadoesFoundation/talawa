




initialize method - EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


Future<void>
initialize({

1. required Map<String, dynamic> args,

})

This function initializes the EventInfoViewModel class with the required arguments.

**params**:

* `args`: A map of arguments required to initialize the EventInfoViewModel class.

**returns**:
None


## Implementation

```
Future<void> initialize({required Map<String, dynamic> args}) async {
  event = args["event"] as Event;
  exploreEventsInstance =
      args["exploreEventViewModel"] as ExploreEventsViewModel;
  fabTitle = getFabTitle();
  await fetchCategories();
  await fetchAgendaItems();
  selectedCategories.clear();
  setState(ViewState.busy);
  attendees = event.attendees ?? [];
  setState(ViewState.idle);
}
```

 


1. [talawa](../../index.html)
2. [event\_info\_view\_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. initialize method

##### EventInfoViewModel class





talawa
1.0.0+1






