
<div>

# fetchAgendaItems method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
fetchAgendaItems(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    eventId]

)



This function is used to fetch all agenda items for a specific
organization.

**params**:

-   `eventId`: ID of the event to fetch agenda items.

**returns**:

-   `Future<dynamic>`: A list of agenda items for the specified
    organization.



## Implementation

``` language-dart
Future<dynamic> fetchAgendaItems(String eventId) async {
  final result = await _dbFunctions.gqlAuthQuery(
    .fetchAgendaItemsByEvent(eventId),
  );
  return result;
}
```







1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  fetchAgendaItems method

##### EventService class







