




createEvent method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. createEvent method

createEvent


dark\_mode

light\_mode




# createEvent method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
createEvent({

1. required [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> variables,

})

This function is used to create an event using a GraphQL mutation.

**params**:

* `variables`: A map of key-value pairs representing the variables required for the GraphQL mutation.

**returns**:

* `Future<QueryResult<Object?>>`: which contains the result of the GraphQL mutation.

## Implementation

```
Future<QueryResult<Object?>> createEvent({
  required Map<String, dynamic> variables,
}) async {
  final result = await databaseFunctions.gqlAuthMutation(
    EventQueries().addEvent(),
    variables: variables,
  );
  return result;
}
```

 


1. [talawa](../../index.html)
2. [event\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/)
3. [EventService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_event_service/EventService-class.html)
4. createEvent method

##### EventService class





talawa
1.0.0+1






