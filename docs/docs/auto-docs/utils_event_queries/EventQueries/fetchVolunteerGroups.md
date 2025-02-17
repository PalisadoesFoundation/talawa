
<div>

# fetchVolunteerGroups method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Fetches event volunteer groups based on criteria such as event ID.

**params**: None

**returns**:

-   `String`: Returns a GraphQL query string to fetch event volunteer
    groups that match the provided criteria.



## Implementation

``` language-dart
String  {
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







1.  [talawa](../../index.html)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  fetchVolunteerGroups method

##### EventQueries class







