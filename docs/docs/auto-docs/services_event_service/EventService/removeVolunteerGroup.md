
<div>

# removeVolunteerGroup method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
removeVolunteerGroup(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    variables]

)



This function is used to remove a volunteer group.

**params**:

-   `variables`: This will be a `map` type and contain the ID of the
    volunteer group to be deleted.

**returns**:

-   `Future<dynamic>`: Information about the removed volunteer group.



## Implementation

``` language-dart
Future<dynamic> removeVolunteerGroup(Map<String, dynamic> variables) async {
  final result = await _dbFunctions.gqlAuthMutation(
    .,
    variables: variables,
  );
  return result;
}
```







1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  removeVolunteerGroup method

##### EventService class







