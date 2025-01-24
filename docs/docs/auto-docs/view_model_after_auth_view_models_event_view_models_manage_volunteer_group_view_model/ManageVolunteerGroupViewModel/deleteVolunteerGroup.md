




deleteVolunteerGroup method - ManageVolunteerGroupViewModel class - manage\_volunteer\_group\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/manage\_volunteer\_group\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model-library.html)
3. [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. deleteVolunteerGroup method

deleteVolunteerGroup


dark\_mode

light\_mode




# deleteVolunteerGroup method


Future<void>
deleteVolunteerGroup(

1. String groupId

)

Deletes a volunteer group.

**params**:

* `groupId`: The ID of the group to delete.

**returns**:
None


## Implementation

```
Future<void> deleteVolunteerGroup(String groupId) async {
  try {
    final variables = {
      'id': groupId,
    };
    final result = await locator<EventService>()
        .removeVolunteerGroup(variables) as QueryResult;
    final data = result.data;

    if (data != null && data['removeEventVolunteerGroup'] != null) {
      notifyListeners();
    }
  } catch (e) {
    print('Error deleting volunteer group: $e');
  }
}
```

 


1. [talawa](../../index.html)
2. [manage\_volunteer\_group\_view\_model](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model-library.html)
3. [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4. deleteVolunteerGroup method

##### ManageVolunteerGroupViewModel class





talawa
1.0.0+1






