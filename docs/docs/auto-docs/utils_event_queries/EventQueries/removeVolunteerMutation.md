
<div>

# removeVolunteerMutation method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Creates a GraphQL mutation for deleting a volunteer from a group.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to delete a volunteer to
    a group.

This function generates a GraphQL mutation string for deleting a
volunteer to a group.



## Implementation

``` language-dart
String  {
  return '''
mutation RemoveEventVolunteer(\$id: ID!) {
  removeEventVolunteer(id: \$id) {
    _id
  }
}
''';
}
```







1.  [talawa](../../index.html)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  removeVolunteerMutation method

##### EventQueries class







