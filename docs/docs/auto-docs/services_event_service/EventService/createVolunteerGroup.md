




createVolunteerGroup method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. createVolunteerGroup method

createVolunteerGroup


dark\_mode

light\_mode




# createVolunteerGroup method


Future
createVolunteerGroup(

1. Map<String, dynamic> variables

)

This function is used to create a volunteer group.

**params**:

* `variables`: this will be `map` type and contain all the volunteer group details need to be created.

**returns**:

* `Future<dynamic>`: Information about the created volunteer group.

## Implementation

```
Future<dynamic> createVolunteerGroup(Map<String, dynamic> variables) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().createVolunteerGroup(),
    variables: {'data': variables},
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. createVolunteerGroup method

##### EventService class





talawa
1.0.0+1






