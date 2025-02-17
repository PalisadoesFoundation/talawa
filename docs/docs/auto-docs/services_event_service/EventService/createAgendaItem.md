
<div>

# createAgendaItem method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
createAgendaItem(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    variables]

)



This function is used to create an agenda item.

**params**:

-   `variables`: A map of key-value pairs representing the variables
    required for the GraphQL mutation.

**returns**:

-   `Future<dynamic>`: Information about the created agenda item.



## Implementation

``` language-dart
Future<dynamic> createAgendaItem(Map<String, dynamic> variables) async {
  final result = await _dbFunctions.gqlAuthMutation(
    .,
    variables: {'input': variables},
  );
  return result;
}
```







1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  createAgendaItem method

##### EventService class







