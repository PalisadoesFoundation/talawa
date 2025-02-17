
<div>

# addEvent method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Creates a GraphQL mutation for adding an event.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to create an event.

This function generates a GraphQL mutation string for creating an event.



## Implementation

``` language-dart
String  {
  return """
  mutation Mutation(\$data: EventInput!, \$recurrenceRuleData: RecurrenceRuleInput) {
    createEvent(data: \$data, recurrenceRuleData: \$recurrenceRuleData) {
      _id
      title
      description
    }
  }
""";
}
```







1.  [talawa](../../index.md)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.md)
4.  addEvent method

##### EventQueries class







