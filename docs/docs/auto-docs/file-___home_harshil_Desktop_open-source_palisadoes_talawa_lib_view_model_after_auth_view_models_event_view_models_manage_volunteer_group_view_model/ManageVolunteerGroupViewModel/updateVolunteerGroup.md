




updateVolunteerGroup method - ManageVolunteerGroupViewModel class - manage\_volunteer\_group\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/manage\_volunteer\_group\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3. [ManageVolunteerGroupViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. updateVolunteerGroup method

updateVolunteerGroup


dark\_mode

light\_mode




# updateVolunteerGroup method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
updateVolunteerGroup(

1. dynamic group,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId,
3. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) name,
4. [int](https://api.flutter.dev/flutter/dart-core/int-class.html) volunteersRequired,

)

Updates the details of a volunteer group.

**params**:

* `group`: The volunteer group to update.
* `eventId`: The ID of the event.
* `name`: The new name for the group.
* `volunteersRequired`: The new number of volunteers required.

**returns**:
None


## Implementation

```
Future<void> updateVolunteerGroup(
  EventVolunteerGroup group,
  String eventId,
  String name,
  int volunteersRequired,
) async {
  final variables = {
    'id': group.id,
    'data': {
      'eventId': eventId,
      'name': name,
      'volunteersRequired': volunteersRequired,
    },
  };

  try {
    final result = await locator<EventService>()
        .updateVolunteerGroup(variables) as QueryResult;

    if (result.data != null) {
      group.name = name;
      group.volunteersRequired = volunteersRequired;
      notifyListeners();
    }
  } catch (e) {
    print('Error updating volunteer group: $e');
  }
}
```

 


1. [talawa](../../index.html)
2. [manage\_volunteer\_group\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3. [ManageVolunteerGroupViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. updateVolunteerGroup method

##### ManageVolunteerGroupViewModel class





talawa
1.0.0+1






