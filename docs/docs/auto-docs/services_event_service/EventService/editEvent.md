




editEvent method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. editEvent method

editEvent


dark\_mode

light\_mode




# editEvent method


Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>
editEvent({

1. required String eventId,
2. required Map<String, dynamic> variables,

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
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. editEvent method

##### EventService class





talawa
1.0.0+1






