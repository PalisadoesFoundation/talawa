




removeEventVolunteerGroup method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. removeEventVolunteerGroup method

removeEventVolunteerGroup


dark\_mode

light\_mode




# removeEventVolunteerGroup method


String
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
2. [event\_queries](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. removeEventVolunteerGroup method

##### EventQueries class





talawa
1.0.0+1






