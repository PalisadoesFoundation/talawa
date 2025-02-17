
<div>

# deleteVolunteerGroup method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
deleteVolunteerGroup(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    groupId]

)



Deletes a volunteer group.

**params**:

-   `groupId`: The ID of the group to delete.

**returns**: None



## Implementation

``` language-dart
Future<void> deleteVolunteerGroup(String groupId) async {
  try {
    final variables = {
      'id': groupId,
    };
    final result = await locator<EventService>()
        .removeVolunteerGroup(variables) as QueryResult;
    final data = result.data;

    if (data != null && data['removeEventVolunteerGroup'] != null) {
      ;
    }
  } catch (e) {
    print('Error deleting volunteer group: $e');
  }
}
```







1.  [talawa](../../index.html)
2.  [manage_volunteer_group_view_model](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3.  [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4.  deleteVolunteerGroup method

##### ManageVolunteerGroupViewModel class







