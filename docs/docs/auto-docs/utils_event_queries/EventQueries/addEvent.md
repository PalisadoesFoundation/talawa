




addEvent method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. addEvent method

addEvent


dark\_mode

light\_mode




# addEvent method


String
addEvent()

Creates a GraphQL mutation for adding an event.

**params**:
None

**returns**:

* `String`: Returns a GraphQL mutation string to create an event.

This function generates a GraphQL mutation string for creating an event.


## Implementation

```
String addEvent() {
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

 


1. [talawa](../../index.html)
2. [event\_queries](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. addEvent method

##### EventQueries class





talawa
1.0.0+1






