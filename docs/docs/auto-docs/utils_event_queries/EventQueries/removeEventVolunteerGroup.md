
<div>

# removeEventVolunteerGroup method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Creates a GraphQL mutation for removing an event volunteer group.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to remove an event
    volunteer group.

This function generates a GraphQL mutation string for removing an event
volunteer group.



## Implementation

``` language-dart
String  {
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







1.  [talawa](../../index.html)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  removeEventVolunteerGroup method

##### EventQueries class







