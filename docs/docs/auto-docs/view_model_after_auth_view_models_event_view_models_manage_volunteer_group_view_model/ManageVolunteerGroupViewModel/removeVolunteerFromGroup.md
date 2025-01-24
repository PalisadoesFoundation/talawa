




removeVolunteerFromGroup method - ManageVolunteerGroupViewModel class - manage\_volunteer\_group\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/manage\_volunteer\_group\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model-library.html)
3. [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. removeVolunteerFromGroup method

removeVolunteerFromGroup


dark\_mode

light\_mode




# removeVolunteerFromGroup method


Future<void>
removeVolunteerFromGroup(

1. String volunteerId

)

Removes a volunteer from the group.

**params**:

* `volunteerId`: The ID of the volunteer to remove.

**returns**:
None


## Implementation

```
Future<void> removeVolunteerFromGroup(String volunteerId) async {
  try {
    final variables = {
      'id': volunteerId,
    };
    final result = await locator<EventService>()
        .removeVolunteerFromGroup(variables) as QueryResult;
    final data = result.data;

    if (data != null && data['removeEventVolunteer'] != null) {
      _volunteers.removeWhere((volunteer) => volunteer.id == volunteerId);
      print('Volunteer removed successfully.');
      notifyListeners();
    } else {
      print('Failed to remove volunteer.');
    }
  } catch (e) {
    print('Error removing volunteer: $e');
  }
}
```

 


1. [talawa](../../index.html)
2. [manage\_volunteer\_group\_view\_model](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model-library.html)
3. [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. removeVolunteerFromGroup method

##### ManageVolunteerGroupViewModel class





talawa
1.0.0+1






