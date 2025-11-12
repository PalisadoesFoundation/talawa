



menu

1.  [talawa](../../index.md)
2.  [services/event_service.dart](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  deleteEvent method


deleteEvent


 dark_mode   light_mode 




<div>

# deleteEvent method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
deleteEvent(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    eventId]

)



This function is used to delete the event.

**params**:

-   `eventId`: id of an event

**returns**:

-   `Future<QueryResult<Object?>>`: Information about the event deletion



## Implementation

``` language-dart
Future<QueryResult<Object?>> deleteEvent(String eventId) async 
```







1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  deleteEvent method

##### EventService class









 talawa 1.0.0+1 
