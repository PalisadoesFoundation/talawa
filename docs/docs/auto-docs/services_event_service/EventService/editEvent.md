



menu

1.  [talawa](../../index.md)
2.  [services/event_service.dart](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  editEvent method


editEvent


 dark_mode   light_mode 




<div>

# editEvent method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]




This function is used to edit an event.

**params**:

-   `eventId`: id of an event
-   `variables`: this will be `map` type and contain all the event
    details need to be update.

**returns**:

-   `Future<QueryResult<Object?>>`: Information about the event
    deletion.



## Implementation

``` language-dart
Future<QueryResult<Object?>>  async 
```







1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  editEvent method

##### EventService class









 talawa 1.0.0+1 
