
<div>

# updateEvent method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
updateEvent({

1.  [dynamic eventId,
    ]

})



Creates a GraphQL mutation for updating an event.

**params**:

-   `eventId`: The ID of the event to update.

**returns**:

-   `String`: Returns a GraphQL mutation string to update the specified
    event.

This function generates a GraphQL mutation string for updating an event
based on the provided parameters. It takes the event ID along with
updated details. The mutation updates the event details and returns the
ID, title, and description of the updated event.



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  updateEvent method

##### EventQueries class







