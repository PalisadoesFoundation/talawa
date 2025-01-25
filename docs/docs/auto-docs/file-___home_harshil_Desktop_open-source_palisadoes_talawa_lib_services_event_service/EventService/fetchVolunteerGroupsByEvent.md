




fetchVolunteerGroupsByEvent method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. fetchVolunteerGroupsByEvent method

fetchVolunteerGroupsByEvent


dark\_mode

light\_mode




# fetchVolunteerGroupsByEvent method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>
fetchVolunteerGroupsByEvent(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId

)

This function is used to fetch all volunteer groups for an event.

**params**:

* `eventId`: Id of the event to fetch volunteer groups.

**returns**:

* `Future<List<EventVolunteerGroup>>`: returns the list of volunteer groups

## Implementation

```
Future<List<EventVolunteerGroup>> fetchVolunteerGroupsByEvent(
  String eventId,
) async {
  try {
    final variables = {
      "where": {"eventId": eventId},
    };
    final result = await _dbFunctions.gqlAuthQuery(
      EventQueries().fetchVolunteerGroups(),
      variables: variables,
    );
    final List groupsJson = result.data!['getEventVolunteerGroups'] as List;

    return groupsJson
        .map(
          (groupJson) =>
              EventVolunteerGroup.fromJson(groupJson as Map<String, dynamic>),
        )
        .toList();
  } catch (e) {
    print('Error fetching volunteer groups: $e');
    rethrow;
  }
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. fetchVolunteerGroupsByEvent method

##### EventService class





talawa
1.0.0+1






