
<div>

# updateVolunteerGroup method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
updateVolunteerGroup(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    variables]

)



This function is used to update the information of a volunteer group.

**params**:

-   `variables`: This is a `Map<String, dynamic>` type that contains the
    ID of the volunteer group to be updated and the fields to be
    updated.

**returns**:

-   `Future<dynamic>`: Information about the updated volunteer group.



## Implementation

``` language-dart
Future<dynamic> updateVolunteerGroup(Map<String, dynamic> variables) async {
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
4.  updateVolunteerGroup method

##### EventService class







