
<div>

# registerForAnEvent method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
registerForAnEvent(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    eventId]

)



This function is used to register user for an event.

**params**:

-   `eventId`: id of an event.

**returns**:

-   `Future<dynamic>`: Information about the event registration.



## Implementation

``` language-dart
Future<dynamic> registerForAnEvent(String eventId) async {
  final Map<String, dynamic> variables = {'eventId': eventId};
  final result = await _dbFunctions.gqlAuthMutation(
    .,
    variables: variables,
  );
  return result;
}
```







1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  registerForAnEvent method

##### EventService class







