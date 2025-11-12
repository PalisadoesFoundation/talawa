



menu

1.  [talawa](../../index.md)
2.  [utils/event_queries.dart](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  deleteEvent method


deleteEvent


 dark_mode   light_mode 




<div>

# deleteEvent method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
deleteEvent(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    id]

)



Creates a GraphQL mutation for deleting an event.

**params**:

-   `id`: The ID of the event to delete.

**returns**:

-   `String`: Returns a GraphQL mutation string to delete the specified
    event.

This function generates a GraphQL mutation string for removing/deleting
an event based on the provided event ID.



## Implementation

``` language-dart
String deleteEvent(String id) 
```







1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  deleteEvent method

##### EventQueries class









 talawa 1.0.0+1 
