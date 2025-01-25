




registerForEvent method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. registerForEvent method

registerForEvent


dark\_mode

light\_mode




# registerForEvent method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
registerForEvent()

Creates a GraphQL mutation for registering for an event.

**params**:
None

**returns**:

* `String`: Returns a GraphQL mutation string to register for the specified event.

This function generates a GraphQL mutation string for registering an individual for an event.


## Implementation

```
String registerForEvent() {
  return """
   mutation registerForEvent(\$eventId: ID!) {
    registerForEvent(id: \$eventId) {
      _id
    }
   }
  """;
}
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. registerForEvent method

##### EventQueries class





talawa
1.0.0+1






