




updateVolunteerGroup method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. updateVolunteerGroup method

updateVolunteerGroup


dark\_mode

light\_mode




# updateVolunteerGroup method


Future
updateVolunteerGroup(

1. Map<String, dynamic> variables

)

This function is used to update the information of a volunteer group.

**params**:

* `variables`: This is a `Map<String, dynamic>` type that contains the ID of the volunteer group to be updated and the fields to be updated.

**returns**:

* `Future<dynamic>`: Information about the updated volunteer group.

## Implementation

```
Future<dynamic> updateVolunteerGroup(Map<String, dynamic> variables) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().updateVolunteerGroupMutation(),
    variables: variables,
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. updateVolunteerGroup method

##### EventService class





talawa
1.0.0+1






