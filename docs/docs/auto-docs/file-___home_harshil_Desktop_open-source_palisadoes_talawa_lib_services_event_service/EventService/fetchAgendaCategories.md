




fetchAgendaCategories method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. fetchAgendaCategories method

fetchAgendaCategories


dark\_mode

light\_mode




# fetchAgendaCategories method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
fetchAgendaCategories(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) orgId

)

This function is used to create an agenda item.

**params**:

* `orgId`: ID of organisation to fetch categories.

**returns**:

* `Future<dynamic>`: Information about the created agenda item.

## Implementation

```
Future<dynamic> fetchAgendaCategories(String orgId) async {
  final result = await _dbFunctions.gqlAuthMutation(
    EventQueries().fetchAgendaItemCategoriesByOrganization(orgId),
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. fetchAgendaCategories method

##### EventService class





talawa
1.0.0+1






