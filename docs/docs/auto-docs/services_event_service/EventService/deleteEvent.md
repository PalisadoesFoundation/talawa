
<div>

# deleteEvent method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
deleteEvent(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    eventId]

)



This function is used to delete the event.

**params**:

-   `eventId`: id of an event

**returns**:

-   `Future<QueryResult<Object?>>`: Information about the event deletion



## Implementation

``` language-dart
Future<QueryResult<Object?>> deleteEvent(String eventId) async {
  final result = await _dbFunctions.gqlAuthMutation(
    .deleteEvent(eventId),
  );
  return result;
}
```







1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  deleteEvent method

##### EventService class







