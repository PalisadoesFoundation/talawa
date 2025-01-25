




removeVolunteerFromGroup method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. removeVolunteerFromGroup method

removeVolunteerFromGroup


dark\_mode

light\_mode




# removeVolunteerFromGroup method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
removeVolunteerFromGroup(

1. [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables

)

This function is used to remove a volunteer from a group.

**params**:

* `variables`: this will be `map` type and contain the ID of the volunteer to be removed.

**returns**:

* `Future<dynamic>`: Information about the removed volunteer.

## Implementation

```
Future<dynamic> removeVolunteerFromGroup(
  Map<String, dynamic> variables,
) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().removeVolunteerMutation(),
    variables: variables,
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. removeVolunteerFromGroup method

##### EventService class





talawa
1.0.0+1






