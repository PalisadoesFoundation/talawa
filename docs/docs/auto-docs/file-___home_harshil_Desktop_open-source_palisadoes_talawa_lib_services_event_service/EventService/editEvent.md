




editEvent method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. editEvent method

editEvent


dark\_mode

light\_mode




# editEvent method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
editEvent({

1. required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId,
2. required [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables,

})

This function is used to edit an event.

**params**:

* `eventId`: id of an event
* `variables`: this will be `map` type and contain all the event details need to be update.

**returns**:

* `Future<QueryResult<Object?>>`: Information about the event deletion.

## Implementation

```
Future<QueryResult<Object?>> editEvent({
  required String eventId,
  required Map<String, dynamic> variables,
}) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().updateEvent(eventId: eventId),
    variables: variables,
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. editEvent method

##### EventService class





talawa
1.0.0+1






