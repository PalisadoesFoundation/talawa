
<div>

# addVolunteerToGroup method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
addVolunteerToGroup(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    volunteerId,
    ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    eventId, ]
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    groupId]

)



Adds a volunteer to the specified group.

**params**:

-   `volunteerId`: The ID of the volunteer to add.
-   `eventId`: The ID of the event.
-   `groupId`: The ID of the group.

**returns**: None



## Implementation

``` language-dart
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
    ;
  } catch (e) {
    print('Error adding volunteer to group: $e');
  }
}
```







1.  [talawa](../../index.html)
2.  [manage_volunteer_group_view_model](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3.  [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.html)
4.  addVolunteerToGroup method

##### ManageVolunteerGroupViewModel class







