
<div>

# createVolunteerGroup method

</div>


[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]




Creates a GraphQL mutation for creating an event volunteer group.

**params**: None

**returns**:

-   `String`: Returns a GraphQL mutation string to create an event
    volunteer group.

This function generates a GraphQL mutation string for creating an event
volunteer group.



## Implementation

``` language-dart
String  {
  return '''
mutation CreateEventVolunteerGroup(\$data: EventVolunteerGroupInput!) {
  createEventVolunteerGroup(data: \$data) {
    _id
    name
    volunteers{
    _id
    }
    createdAt
    volunteersRequired
    creator{
    _id
    }
  }
}
''';
}
```







1.  [talawa](../../index.html)
2.  [event_queries](../../utils_event_queries/)
3.  [EventQueries](../../utils_event_queries/EventQueries-class.html)
4.  createVolunteerGroup method

##### EventQueries class







