




initialize method - ManageVolunteerGroupViewModel class - manage\_volunteer\_group\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/manage\_volunteer\_group\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3. [ManageVolunteerGroupViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
initialize(

1. dynamic parentEvent,
2. dynamic group

)

Initializes the view model with the given event and volunteer group.

**params**:

* `parentEvent`: The event associated with the volunteer group.
* `group`: The volunteer group to be managed.

**returns**:
None


## Implementation

```
Future<void> initialize(Event parentEvent, EventVolunteerGroup group) async {
  setState(ViewState.busy);

  event = parentEvent;
  if (group.volunteers != null) {
    _volunteers = List<EventVolunteer>.from(group.volunteers!);
  }

  setState(ViewState.idle);
}
```

 


1. [talawa](../../index.html)
2. [manage\_volunteer\_group\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3. [ManageVolunteerGroupViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. initialize method

##### ManageVolunteerGroupViewModel class





talawa
1.0.0+1






