




addEvent method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. addEvent method

addEvent


dark\_mode

light\_mode




# addEvent method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
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
2. [event\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. addEvent method

##### EventQueries class





talawa
1.0.0+1






