
<div>

# createEvent method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]\>]]\>]]
createEvent({

1.  [required
    [[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    variables, ]

})



This function is used to create an event using a GraphQL mutation.

**params**:

-   `variables`: A map of key-value pairs representing the variables
    required for the GraphQL mutation.

**returns**:

-   `Future<QueryResult<Object?>>`: which contains the result of the
    GraphQL mutation.



## Implementation

``` language-dart
Future<QueryResult<Object?>> createEvent({
  required Map<String, dynamic> variables,
}) async {
  final result = await databaseFunctions.gqlAuthMutation(
    .,
    variables: variables,
  );
  return result;
}
```







1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  createEvent method

##### EventService class







