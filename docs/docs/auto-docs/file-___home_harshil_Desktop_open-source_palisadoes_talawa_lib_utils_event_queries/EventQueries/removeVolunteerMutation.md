




removeVolunteerMutation method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. removeVolunteerMutation method

removeVolunteerMutation


dark\_mode

light\_mode




# removeVolunteerMutation method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
removeVolunteerMutation()

Creates a GraphQL mutation for deleting a volunteer from a group.

**params**:
None

**returns**:

* `String`: Returns a GraphQL mutation string to delete a volunteer to a group.

This function generates a GraphQL mutation string for deleting a volunteer to a group.


## Implementation

```
String removeVolunteerMutation() {
  return '''
mutation RemoveEventVolunteer(\$id: ID!) {
  removeEventVolunteer(id: \$id) {
    _id
  }
}
''';
}
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. removeVolunteerMutation method

##### EventQueries class





talawa
1.0.0+1






