




attendeesByEvent method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. attendeesByEvent method

attendeesByEvent


dark\_mode

light\_mode




# attendeesByEvent method


String
attendeesByEvent(

1. String eventId

)

Fetches attendees by event ID.

**params**:

* `eventId`: The ID of the event to fetch registrants for.

**returns**:

* `String`: Returns a GraphQL query string to retrieve registrants associated with the specified event ID.

This function generates a GraphQL query string to fetch registrants
based on the provided event ID.


## Implementation

```
String attendeesByEvent(String eventId) {
  return '''
    query {
      getEventAttendeesByEventId(eventId: "$eventId") {
        eventId
        userId
        isRegistered
        isInvited
        isCheckedIn
        isCheckedOut
      }
    }
  ''';
}
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. attendeesByEvent method

##### EventQueries class





talawa
1.0.0+1






