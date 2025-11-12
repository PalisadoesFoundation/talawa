



menu

1.  [talawa](../../index.md)
2.  [view_model/after_auth_view_models/event_view_models/event_info_view_model.dart](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.md)
4.  createAgendaItem method


createAgendaItem


 dark_mode   light_mode 




<div>

# createAgendaItem method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[EventAgendaItem](../../models_events_event_agenda_item/EventAgendaItem-class.md)?]\>]]




This function is used to create a new agenda item for an event.

**params**:

-   `title`: Title of the agenda item.
-   `description`: Description of the agenda item (optional).
-   `duration`: Duration of the agenda item.
-   `attachments`: List of attachment URLs (optional).
-   `urls`: List of related URLs (optional).
-   `categories`: List of category IDs (optional).
-   `sequence`: Sequence number of the agenda item.
-   `itemType`: Type of the agenda item.
-   `isNote`: Whether the agenda item is a note or not.

**returns**:

-   `Future<EventAgendaItem?>`: Returns the new agenda item if creation
    is successful.



## Implementation

``` language-dart
Future<EventAgendaItem?>  async 
```







1.  [talawa](../../index.md)
2.  [event_info_view_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/)
3.  [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.md)
4.  createAgendaItem method

##### EventInfoViewModel class









 talawa 1.0.0+1 
