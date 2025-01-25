




fetchAttendeesByEvent method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. fetchAttendeesByEvent method

fetchAttendeesByEvent


dark\_mode

light\_mode




# fetchAttendeesByEvent method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
fetchAttendeesByEvent(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId

)

This function is used to fetch all registrants of an event.

**params**:

* `eventId`: id of an event.

**returns**:

* `Future<dynamic>`: Information about event registrants.

## Implementation

```
Future<dynamic> fetchAttendeesByEvent(String eventId) async {
  final result = await _dbFunctions.gqlAuthQuery(
    EventQueries().attendeesByEvent(eventId),
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. fetchAttendeesByEvent method

##### EventService class





talawa
1.0.0+1






