




addVolunteerToGroup method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. addVolunteerToGroup method

addVolunteerToGroup


dark\_mode

light\_mode




# addVolunteerToGroup method


Future
addVolunteerToGroup(

1. Map<String, dynamic> variables

)

This function is used to add a volunteer to a group.

**params**:

* `variables`: this will be `map` type and contain all the details needed to add a volunteer to a group.

**returns**:

* `Future<dynamic>`: Information about the added volunteer.

## Implementation

```
Future<dynamic> addVolunteerToGroup(Map<String, dynamic> variables) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().addVolunteerToGroup(),
    variables: {'data': variables},
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. addVolunteerToGroup method

##### EventService class





talawa
1.0.0+1






