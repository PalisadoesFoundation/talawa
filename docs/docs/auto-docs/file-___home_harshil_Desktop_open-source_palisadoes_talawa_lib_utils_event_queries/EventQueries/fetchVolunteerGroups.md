




fetchVolunteerGroups method - EventQueries class - event\_queries library - Dart API







menu

1. [talawa](../../index.html)
2. [utils/event\_queries.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. fetchVolunteerGroups method

fetchVolunteerGroups


dark\_mode

light\_mode




# fetchVolunteerGroups method


[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
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
2. [event\_queries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/)
3. [EventQueries](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_utils_event_queries/EventQueries-class.html)
4. fetchVolunteerGroups method

##### EventQueries class





talawa
1.0.0+1






