
<div>

# fetchVolunteerGroupsByEvent method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[EventVolunteerGroup](../../models_events_event_volunteer_group/EventVolunteerGroup-class.html)]\>]]\>]]
fetchVolunteerGroupsByEvent(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    eventId]

)



This function is used to fetch all volunteer groups for an event.

**params**:

-   `eventId`: Id of the event to fetch volunteer groups.

**returns**:

-   `Future<List<EventVolunteerGroup>>`: returns the list of volunteer
    groups



## Implementation

``` language-dart
Future<List<EventVolunteerGroup>> fetchVolunteerGroupsByEvent(
  String eventId,
) async {
  try {
    final variables = {
      "where": {"eventId": eventId},
    };
    final result = await _dbFunctions.gqlAuthQuery(
      .,
      variables: variables,
    );
    final List groupsJson = result.data!['getEventVolunteerGroups'] as List;

    return groupsJson
        .map(
          (groupJson) =>
              EventVolunteerGroup.fromJson(groupJson as Map<String, dynamic>),
        )
        .;
  } catch (e) {
    print('Error fetching volunteer groups: $e');
    rethrow;
  }
}
```







1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  fetchVolunteerGroupsByEvent method

##### EventService class







