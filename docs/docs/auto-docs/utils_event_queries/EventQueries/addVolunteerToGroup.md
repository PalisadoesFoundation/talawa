
<div>

# addVolunteerToGroup method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Creates a GraphQL mutation for adding a volunteer to a group.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to add a volunteer to a
    group.

This function generates a GraphQL mutation string for adding a volunteer
to a group.



## Implementation

``` language-dart
String  {
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







1.  [talawa](../../index.html)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  addVolunteerToGroup method

##### EventQueries class







