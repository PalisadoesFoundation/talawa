




attendeesByEvent method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. attendeesByEvent method

attendeesByEvent


dark\_mode

light\_mode




# attendeesByEvent method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
attendeesByEvent(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) eventId

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
2. [event\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. attendeesByEvent method

##### EventQueries class





talawa
1.0.0+1






