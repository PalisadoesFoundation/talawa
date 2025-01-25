




registerForAnEvent method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. registerForAnEvent method

registerForAnEvent


dark\_mode

light\_mode




# registerForAnEvent method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
registerForAnEvent(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId

)

This function is used to register user for an event.

**params**:

* `eventId`: id of an event.

**returns**:

* `Future<dynamic>`: Information about the event registration.

## Implementation

```
Future<dynamic> registerForAnEvent(String eventId) async {
  final Map<String, dynamic> variables = {'eventId': eventId};
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().registerForEvent(),
    variables: variables,
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. registerForAnEvent method

##### EventService class





talawa
1.0.0+1






