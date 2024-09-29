


# updateEvent method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) updateEvent
({dynamic eventId})








## Implementation

```dart
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







