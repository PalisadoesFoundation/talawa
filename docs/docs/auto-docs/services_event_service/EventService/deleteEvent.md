




deleteEvent method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. deleteEvent method

deleteEvent


dark\_mode

light\_mode




# deleteEvent method


Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>
deleteEvent(

1. String eventId

)

This function is used to delete the event.

**params**:

* `eventId`: id of an event

**returns**:

* `Future<QueryResult<Object?>>`: Information about the event deletion

## Implementation

```
Future<QueryResult<Object?>> deleteEvent(String eventId) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().deleteEvent(eventId),
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. deleteEvent method

##### EventService class





talawa
1.0.0+1






