




updateAgendaItem method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. updateAgendaItem method

updateAgendaItem


dark\_mode

light\_mode




# updateAgendaItem method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
updateAgendaItem(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) itemId,
2. [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables

)

This function is used to update an agenda item.

**params**:

* `itemId`: Id of agenda item which is to be updated
* `variables`: A map of key-value pairs representing the variables required for the GraphQL mutation.

**returns**:

* `Future<dynamic>`: Information about the updated agenda item.

## Implementation

```
Future<dynamic> updateAgendaItem(
  String itemId,
  Map<String, dynamic> variables,
) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().updateAgendaItem(),
    variables: {
      'updateAgendaItemId': itemId,
      'input': variables,
    },
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. updateAgendaItem method

##### EventService class





talawa
1.0.0+1






