




createAgendaItem method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. createAgendaItem method

createAgendaItem


dark\_mode

light\_mode




# createAgendaItem method


Future
createAgendaItem(

1. Map<String, dynamic> variables

)

This function is used to create an agenda item.

**params**:

* `variables`: A map of key-value pairs representing the variables required for the GraphQL mutation.

**returns**:

* `Future<dynamic>`: Information about the created agenda item.

## Implementation

```
Future<dynamic> createAgendaItem(Map<String, dynamic> variables) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().createAgendaItem(),
    variables: {'input': variables},
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. createAgendaItem method

##### EventService class





talawa
1.0.0+1






