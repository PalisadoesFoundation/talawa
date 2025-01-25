




removeEventVolunteerGroup method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. removeEventVolunteerGroup method

removeEventVolunteerGroup


dark\_mode

light\_mode




# removeEventVolunteerGroup method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
removeEventVolunteerGroup()

Creates a GraphQL mutation for removing an event volunteer group.

**params**:
None

**returns**:

* `String`: Returns a GraphQL mutation string to remove an event volunteer group.

This function generates a GraphQL mutation string for removing an event volunteer group.


## Implementation

```
String removeEventVolunteerGroup() {
  return '''
mutation RemoveEventVolunteerGroup(\$id: ID!) {
  removeEventVolunteerGroup(id: \$id) {
  _id
  name
  }
}
''';
}
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. removeEventVolunteerGroup method

##### EventQueries class





talawa
1.0.0+1






