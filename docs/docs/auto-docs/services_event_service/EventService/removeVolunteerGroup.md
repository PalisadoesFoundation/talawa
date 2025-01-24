




removeVolunteerGroup method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. removeVolunteerGroup method

removeVolunteerGroup


dark\_mode

light\_mode




# removeVolunteerGroup method


Future
removeVolunteerGroup(

1. Map<String, dynamic> variables

)

This function is used to remove a volunteer group.

**params**:

* `variables`: This will be a `map` type and contain the ID of the volunteer group to be deleted.

**returns**:

* `Future<dynamic>`: Information about the removed volunteer group.

## Implementation

```
Future<dynamic> removeVolunteerGroup(Map<String, dynamic> variables) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().removeEventVolunteerGroup(),
    variables: variables,
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. removeVolunteerGroup method

##### EventService class





talawa
1.0.0+1






