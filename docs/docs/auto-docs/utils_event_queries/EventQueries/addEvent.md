


# addEvent method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) addEvent
()








## Implementation

```dart
String addEvent() {
  return """
   mutation createEvent( \$organizationId: ID!,
      \$title:String!,
      \$description: String!,
      \$startTime: Time,
      \$endTime: Time,
      \$allDay: Boolean!,
      \$recurring: Boolean!,
      \$isPublic: Boolean!,
      \$isRegisterable: Boolean!,
      \$location: String,
      \$startDate : Date!,
      \$endDate : Date!,
    ) {
    createEvent(
      data:{
        organizationId: \$organizationId,
         title: \$title,
         description: \$description,
         isPublic: \$isPublic,
         isRegisterable: \$isRegisterable,
         recurring: \$recurring,
         allDay: \$allDay,
         startTime: \$startTime,
         endTime: \$endTime,
         startDate: \$startDate,
         endDate: \$endDate,
         location: \$location,
      }
    ){
      _id
      title
      description
    }
  }
""";
}
```







