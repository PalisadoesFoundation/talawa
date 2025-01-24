




addVolunteerToGroup method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. addVolunteerToGroup method

addVolunteerToGroup


dark\_mode

light\_mode




# addVolunteerToGroup method


String
addVolunteerToGroup()

Creates a GraphQL mutation for adding a volunteer to a group.

**params**:
None

**returns**:

* `String`: Returns a GraphQL mutation string to add a volunteer to a group.

This function generates a GraphQL mutation string for adding a volunteer to a group.


## Implementation

```
String addVolunteerToGroup() {
  return '''
  mutation CreateEventVolunteer(\$data: EventVolunteerInput!) {
    createEventVolunteer(data: \$data) {
      _id
      isAssigned
      response
      creator{
      _id
      }
      group{
      _id
      name
      }
      isInvited
      user{
      _id
      firstName
      lastName
      }
    }
  }
  ''';
}
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. addVolunteerToGroup method

##### EventQueries class





talawa
1.0.0+1






