




fetchVolunteerGroups method - EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. fetchVolunteerGroups method

fetchVolunteerGroups


dark\_mode

light\_mode




# fetchVolunteerGroups method


Future<void>
fetchVolunteerGroups(

1. String eventId

)

Fetches all volunteer groups for the current event.

**params**:

* `eventId`: The ID of the event to fetch volunteer groups for.

**returns**:
None


## Implementation

```
Future<void> fetchVolunteerGroups(String eventId) async {
  try {
    final result =
        await locator<EventService>().fetchVolunteerGroupsByEvent(eventId);

    _volunteerGroups.clear();
    _volunteerGroups.addAll(result);
    notifyListeners();
  } catch (e) {
    print('Error fetching volunteer groups: $e');
    setState(ViewState.idle);
  }
}
```

 


1. [talawa](../../index.html)
2. [event\_info\_view\_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. fetchVolunteerGroups method

##### EventInfoViewModel class





talawa
1.0.0+1






