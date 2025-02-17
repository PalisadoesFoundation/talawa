
<div>

# createVolunteerGroup method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[EventVolunteerGroup](../../models_events_event_volunteer_group/EventVolunteerGroup-class.html)?]\>]]
createVolunteerGroup(

1.  [[[Event](../../models_events_event_model/Event-class.html)]
    event, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    groupName,
    ]
3.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
    volunteersRequired]

)



This function is used to create a new volunteer group for an event.

**params**:

-   `event`: Name of the group
-   `groupName`: Name of the group
-   `volunteersRequired`: Total number of volunteers required for the
    group

**returns**:

-   `Future<EventVolunteerGroup?>`: returns the new volunteer group for
    an event



## Implementation

``` language-dart
Future<EventVolunteerGroup?> createVolunteerGroup(
  Event event,
  String groupName,
  int volunteersRequired,
) async {
  try {
    final variables = {
      'eventId': event.id,
      'name': groupName,
      'volunteersRequired': volunteersRequired,
    };

    final result = await locator<EventService>()
        .createVolunteerGroup(variables) as QueryResult;

    if (result.data == null ||
        result.data!['createEventVolunteerGroup'] == null) {
      throw Exception('Failed to create volunteer group or no data returned');
    }

    final data = result.data!['createEventVolunteerGroup'];
    final newGroup =
        EventVolunteerGroup.fromJson(data as Map<String, dynamic>);

    _volunteerGroups.add(newGroup);
    ;

    return newGroup;
  } catch (e) {
    print('Error creating volunteer group: $e');
  }
  return null;
}
```







1.  [talawa](../../index.html)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4.  createVolunteerGroup method

##### EventInfoViewModel class







