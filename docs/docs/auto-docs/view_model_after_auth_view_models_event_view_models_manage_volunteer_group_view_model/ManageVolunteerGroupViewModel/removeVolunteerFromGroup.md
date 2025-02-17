
<div>

# removeVolunteerFromGroup method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
removeVolunteerFromGroup(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    volunteerId]

)



Removes a volunteer from the group.

**params**:

-   `volunteerId`: The ID of the volunteer to remove.

**returns**: None



## Implementation

``` language-dart
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
      ;
    } else {
      print('Failed to remove volunteer.');
    }
  } catch (e) {
    print('Error removing volunteer: $e');
  }
}
```







1.  [talawa](../../index.html)
2.  [manage_volunteer_group_view_model](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3.  [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4.  removeVolunteerFromGroup method

##### ManageVolunteerGroupViewModel class







