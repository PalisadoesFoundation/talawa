
<div>

# updateVolunteerGroupMutation method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Mutation to update volunteer group insatnce.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to update a volunteer
    group



## Implementation

``` language-dart
String  {
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







1.  [talawa](../../index.html)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  updateVolunteerGroupMutation method

##### EventQueries class







