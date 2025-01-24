




updateVolunteerGroupMutation method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. updateVolunteerGroupMutation method

updateVolunteerGroupMutation


dark\_mode

light\_mode




# updateVolunteerGroupMutation method


String
updateVolunteerGroupMutation()

Mutation to update volunteer group insatnce.

**params**:
None

**returns**:

* `String`: Returns a GraphQL mutation string to update a volunteer group

## Implementation

```
String updateVolunteerGroupMutation() {
  return '''
    mutation UpdateEventVolunteerGroup(\$id: ID!, \$data: UpdateEventVolunteerGroupInput!) {
      updateEventVolunteerGroup(id: \$id, data: \$data) {
        _id
        name
        volunteersRequired
      }
    }
  ''';
}
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. updateVolunteerGroupMutation method

##### EventQueries class





talawa
1.0.0+1






