
<div>

# registerForAnEvent method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
registerForAnEvent(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
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







1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  registerForAnEvent method

##### EventService class







