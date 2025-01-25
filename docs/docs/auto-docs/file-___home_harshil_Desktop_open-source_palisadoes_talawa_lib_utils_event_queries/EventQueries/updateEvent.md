




updateEvent method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. updateEvent method

updateEvent


dark\_mode

light\_mode




# updateEvent method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
updateEvent({

1. dynamic eventId,

})

Creates a GraphQL mutation for updating an event.

**params**:

* `eventId`: The ID of the event to update.

**returns**:

* `String`: Returns a GraphQL mutation string to update the specified event.

This function generates a GraphQL mutation string for updating an event
based on the provided parameters. It takes the event ID along with updated
details.
The mutation updates the event details and returns the ID, title, and description
of the updated event.


## Implementation

```
String updateEvent({
  eventId,
}) {
  return """mutation updateEvent(
      \$title:String!,
      \$description: String!,
      \$startTime: Time,
      \$endTime: Time,
      \$allDay: Boolean!,
      \$recurring: Boolean!,
      \$isPublic: Boolean!,
      \$isRegisterable: Boolean!,
      \$location: String,
    ) {
    updateEvent(
       id: "$eventId"
       data:{
         title: \$title,
         description: \$description,
         isPublic: \$isPublic,
         isRegisterable: \$isRegisterable,
         recurring: \$recurring,
         allDay: \$allDay,
         startTime: \$startTime
         endTime: \$endTime
         location: \$location
       }
       ){
          _id
          title
          description
        }
    }""";
}
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. updateEvent method

##### EventQueries class





talawa
1.0.0+1






