




addVolunteerToGroup method - ManageVolunteerGroupViewModel class - manage\_volunteer\_group\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/manage\_volunteer\_group\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3. [ManageVolunteerGroupViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. addVolunteerToGroup method

addVolunteerToGroup


dark\_mode

light\_mode




# addVolunteerToGroup method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
addVolunteerToGroup(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) volunteerId,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId,
3. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) groupId

)

Adds a volunteer to the specified group.

**params**:

* `volunteerId`: The ID of the volunteer to add.
* `eventId`: The ID of the event.
* `groupId`: The ID of the group.

**returns**:
None


## Implementation

```
Future<void> addVolunteerToGroup(
  String volunteerId,
  String eventId,
  String groupId,
) async {
  try {
    final variables = {
      'eventId': eventId,
      'userId': volunteerId,
      'groupId': groupId,
    };
    final result = await locator<EventService>()
        .addVolunteerToGroup(variables) as QueryResult;
    final data = result.data!;
    final addedVolunteerData =
        data['createEventVolunteer'] as Map<String, dynamic>;
    final addedVolunteer = EventVolunteer.fromJson(addedVolunteerData);
    _volunteers.add(addedVolunteer);
    notifyListeners();
  } catch (e) {
    print('Error adding volunteer to group: $e');
  }
}
```

 


1. [talawa](../../index.html)
2. [manage\_volunteer\_group\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3. [ManageVolunteerGroupViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. addVolunteerToGroup method

##### ManageVolunteerGroupViewModel class





talawa
1.0.0+1






