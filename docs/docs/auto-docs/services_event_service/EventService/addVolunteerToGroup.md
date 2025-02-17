
<div>

# addVolunteerToGroup method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
addVolunteerToGroup(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    variables]

)



This function is used to add a volunteer to a group.

**params**:

-   `variables`: this will be `map` type and contain all the details
    needed to add a volunteer to a group.

**returns**:

-   `Future<dynamic>`: Information about the added volunteer.



## Implementation

``` language-dart
Future<dynamic> addVolunteerToGroup(Map<String, dynamic> variables) async {
  final result = await _dbFunctions.gqlAuthMutation(
    .,
    variables: {'data': variables},
  );
  return result;
}
```







1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  addVolunteerToGroup method

##### EventService class







