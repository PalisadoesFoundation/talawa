




initialize method - EditAgendaItemViewModel class - edit\_agenda\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/edit\_agenda\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/view_model_after_auth_view_models_event_view_models_edit_agenda_view_model-library.html)
3. [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


void
initialize(

1. [EventAgendaItem](../../models_events_event_agenda_item/EventAgendaItem-class.html) agendaItem,
2. List<[AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.html)> categories

)

aInitializes the ViewModel with the provided agenda item and categories.

**params**:

* `agendaItem`: The [EventAgendaItem](../../models_events_event_agenda_item/EventAgendaItem-class.html) to be edited.
* `categories`: List of all available [AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.html) for the event.

**returns**:
None


## Implementation

```
void initialize(EventAgendaItem agendaItem, List<AgendaCategory> categories) {
  _agendaItem = agendaItem;
  _categories = categories;
  _fillEditForm();
}
```

 


1. [talawa](../../index.html)
2. [edit\_agenda\_view\_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/view_model_after_auth_view_models_event_view_models_edit_agenda_view_model-library.html)
3. [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. initialize method

##### EditAgendaItemViewModel class





talawa
1.0.0+1






