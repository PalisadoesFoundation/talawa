
<div>

# fetchVolunteerGroupsByEvent method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[EventVolunteerGroup](../../models_events_event_volunteer_group/EventVolunteerGroup-class.md)]\>]]\>]]
fetchVolunteerGroupsByEvent(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    eventId]

)



This function is used to fetch all volunteer groups for an event.

**params**:

-   `eventId`: Id of the event to fetch volunteer groups.

**returns**:

-   `Future&lt;List&lt;EventVolunteerGroup&gt;&gt;`: returns the list of volunteer
    groups



## Implementation

``` language-dart
Future&lt;List&lt;EventVolunteerGroup&gt;&gt; fetchVolunteerGroupsByEvent(
  String eventId,
) async 
```







1.  [talawa](../../index.md)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.md)
4.  fetchVolunteerGroupsByEvent method

##### EventService class







