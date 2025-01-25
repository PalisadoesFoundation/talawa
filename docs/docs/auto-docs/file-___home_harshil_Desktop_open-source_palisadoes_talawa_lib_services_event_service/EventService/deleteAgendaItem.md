




deleteAgendaItem method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. deleteAgendaItem method

deleteAgendaItem


dark\_mode

light\_mode




# deleteAgendaItem method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
deleteAgendaItem(

1. [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables

)

This function is used to delete an agenda item.

**params**:

* `variables`: A map of key-value pairs representing the variables required for the GraphQL mutation.

**returns**:

* `Future<dynamic>`: Information about the deleted agenda item.

## Implementation

```
Future<dynamic> deleteAgendaItem(Map<String, dynamic> variables) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().deleteAgendaItem(),
    variables: variables,
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. deleteAgendaItem method

##### EventService class





talawa
1.0.0+1






