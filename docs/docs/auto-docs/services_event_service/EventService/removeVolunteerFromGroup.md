



menu

1.  [talawa](../../index.md)
2.  [services/event_service.dart](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  removeVolunteerFromGroup method


removeVolunteerFromGroup


 dark_mode   light_mode 




<div>

# removeVolunteerFromGroup method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]
removeVolunteerFromGroup(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    variables]

)



This function is used to remove a volunteer from a group.

**params**:

-   `variables`: this will be `map` type and contain the ID of the
    volunteer to be removed.

**returns**:

-   `Future<dynamic>`: Information about the removed volunteer.



## Implementation

``` language-dart
Future<dynamic> removeVolunteerFromGroup(
  Map<String, dynamic> variables,
) async 
```







1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  removeVolunteerFromGroup method

##### EventService class









 talawa 1.0.0+1 
