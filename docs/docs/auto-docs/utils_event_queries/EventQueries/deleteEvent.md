




deleteEvent method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. deleteEvent method

deleteEvent


dark\_mode

light\_mode




# deleteEvent method


String
deleteEvent(

1. String id

)

Creates a GraphQL mutation for deleting an event.

**params**:

* `id`: The ID of the event to delete.

**returns**:

* `String`: Returns a GraphQL mutation string to delete the specified event.

This function generates a GraphQL mutation string for removing/deleting an event
based on the provided event ID.


## Implementation

```
String deleteEvent(String id) {
  return """
    mutation {
      removeEvent(
        id: "$id",
        ){
          _id
        }
      }
  """;
}
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. deleteEvent method

##### EventQueries class





talawa
1.0.0+1






