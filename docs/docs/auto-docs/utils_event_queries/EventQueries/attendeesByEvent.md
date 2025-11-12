



menu

1.  [talawa](../../index.md)
2.  [utils/event_queries.dart](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  attendeesByEvent method


attendeesByEvent


 dark_mode   light_mode 




<div>

# attendeesByEvent method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
attendeesByEvent(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    eventId]

)



Fetches attendees by event ID.

**params**:

-   `eventId`: The ID of the event to fetch registrants for.

**returns**:

-   `String`: Returns a GraphQL query string to retrieve registrants
    associated with the specified event ID.

This function generates a GraphQL query string to fetch registrants
based on the provided event ID.



## Implementation

``` language-dart
String attendeesByEvent(String eventId) 
```







1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  attendeesByEvent method

##### EventQueries class









 talawa 1.0.0+1 
