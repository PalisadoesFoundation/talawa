
<div>

# editEvent method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
editEvent({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    eventId, ]
2.  [required
    [[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    variables, ]

})



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
Future<QueryResult<Object?>> editEvent({
  required String eventId,
  required Map<String, dynamic> variables,
}) async {
  final result = await _dbFunctions.gqlAuthMutation(
    .updateEvent(eventId: eventId),
    variables: variables,
  );
  return result;
}
```







1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  editEvent method

##### EventService class







