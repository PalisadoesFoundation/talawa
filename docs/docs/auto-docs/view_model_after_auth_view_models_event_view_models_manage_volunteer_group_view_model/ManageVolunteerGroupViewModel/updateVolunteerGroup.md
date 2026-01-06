
<div>

# updateVolunteerGroup method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
updateVolunteerGroup(

1.  [[[EventVolunteerGroup](../../models_events_event_volunteer_group/EventVolunteerGroup-class.md)]
    group, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    eventId, ]
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    name, ]
4.  [[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
    volunteersRequired,
    ]

)



Updates the details of a volunteer group.

**params**:

-   `group`: The volunteer group to update.
-   `eventId`: The ID of the event.
-   `name`: The new name for the group.
-   `volunteersRequired`: The new number of volunteers required.

**returns**: None



## Implementation

``` language-dart
Future&lt;void&gt; updateVolunteerGroup(
  EventVolunteerGroup group,
  String eventId,
  String name,
  int volunteersRequired,
) async 
```







1.  [talawa](../../index.md)
2.  [manage_volunteer_group_view_model](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/)
3.  [ManageVolunteerGroupViewModel](../../view_model_after_auth_view_models_event_view_models_manage_volunteer_group_view_model/ManageVolunteerGroupViewModel-class.md)
4.  updateVolunteerGroup method

##### ManageVolunteerGroupViewModel class







