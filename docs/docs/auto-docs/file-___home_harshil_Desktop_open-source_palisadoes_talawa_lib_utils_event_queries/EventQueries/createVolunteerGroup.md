




createVolunteerGroup method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. createVolunteerGroup method

createVolunteerGroup


dark\_mode

light\_mode




# createVolunteerGroup method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
createVolunteerGroup()

Creates a GraphQL mutation for creating an event volunteer group.

**params**:
None

**returns**:

* `String`: Returns a GraphQL mutation string to create an event volunteer group.

This function generates a GraphQL mutation string for creating an event volunteer group.


## Implementation

```
String createVolunteerGroup() {
  return '''
mutation CreateEventVolunteerGroup(\$data: EventVolunteerGroupInput!) {
  createEventVolunteerGroup(data: \$data) {
    _id
    name
    volunteers{
    _id
    }
    createdAt
    volunteersRequired
    creator{
    _id
    }
  }
}
''';
}
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. createVolunteerGroup method

##### EventQueries class





talawa
1.0.0+1






