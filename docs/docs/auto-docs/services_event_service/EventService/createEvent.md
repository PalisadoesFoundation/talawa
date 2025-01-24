




createEvent method - EventService class - event\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/event\_service.dart](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. createEvent method

createEvent


dark\_mode

light\_mode




# createEvent method


Future<[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)<Object?>>
createEvent({

1. required Map<String, dynamic> variables,

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
2. [event\_service](../../services_event_service/services_event_service-library.html)
3. [EventService](../../services_event_service/EventService-class.html)
4. createEvent method

##### EventService class





talawa
1.0.0+1






