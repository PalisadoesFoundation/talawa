




fetchVolunteerGroups method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. fetchVolunteerGroups method

fetchVolunteerGroups


dark\_mode

light\_mode




# fetchVolunteerGroups method


String
fetchVolunteerGroups()

Fetches event volunteer groups based on criteria such as event ID.

**params**:
None

**returns**:

* `String`: Returns a GraphQL query string to fetch event volunteer groups that match the provided criteria.

## Implementation

```
String fetchVolunteerGroups() {
  return '''
    query GetEventVolunteerGroups(\$where: EventVolunteerGroupWhereInput) {
      getEventVolunteerGroups(where: \$where) {
        _id
        name
        volunteersRequired
        createdAt
        volunteers{
        _id
        response
        user{
        _id
        firstName
        lastName
        }
        }
      }
    }
  ''';
}
```

 


1. [talawa](../../index.html)
2. [event\_queries](../../utils_event_queries/utils_event_queries-library.html)
3. [EventQueries](../../utils_event_queries/EventQueries-class.html)
4. fetchVolunteerGroups method

##### EventQueries class





talawa
1.0.0+1






