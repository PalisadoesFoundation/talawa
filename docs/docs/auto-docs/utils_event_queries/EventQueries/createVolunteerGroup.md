




createVolunteerGroup method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. createVolunteerGroup method

createVolunteerGroup


dark\_mode

light\_mode




# createVolunteerGroup method


String
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
2. [event\_queries](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. createVolunteerGroup method

##### EventQueries class





talawa
1.0.0+1






