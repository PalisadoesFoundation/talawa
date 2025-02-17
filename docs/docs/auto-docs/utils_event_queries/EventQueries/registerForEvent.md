
<div>

# registerForEvent method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Creates a GraphQL mutation for registering for an event.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to register for the
    specified event.

This function generates a GraphQL mutation string for registering an
individual for an event.



## Implementation

``` language-dart
String  {
  return """
   mutation registerForEvent(\$eventId: ID!) {
    registerForEvent(id: \$eventId) {
      _id
    }
   }
  """;
}
```







1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  registerForEvent method

##### EventQueries class







