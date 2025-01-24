




fetchAgendaItems method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. fetchAgendaItems method

fetchAgendaItems


dark\_mode

light\_mode




# fetchAgendaItems method


Future
fetchAgendaItems(

1. String eventId

)

This function is used to fetch all agenda items for a specific organization.

**params**:

* `eventId`: ID of the event to fetch agenda items.

**returns**:

* `Future<dynamic>`: A list of agenda items for the specified organization.

## Implementation

```
Future<dynamic> fetchAgendaItems(String eventId) async {
  final result = await _dbFunctions.gqlAuthQuery(
    EventQueries().fetchAgendaItemsByEvent(eventId),
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. fetchAgendaItems method

##### EventService class





talawa
1.0.0+1






