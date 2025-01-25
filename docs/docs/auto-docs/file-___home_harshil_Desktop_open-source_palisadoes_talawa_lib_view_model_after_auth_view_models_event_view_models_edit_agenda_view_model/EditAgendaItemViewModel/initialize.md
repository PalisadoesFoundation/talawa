




initialize method - EditAgendaItemViewModel class - edit\_agenda\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/edit\_agenda\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3. [EditAgendaItemViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


void
initialize(

1. dynamic agendaItem,
2. [List](https://api.flutter.dev/flutter/dart-core/List-class.html) categories

)

aInitializes the ViewModel with the provided agenda item and categories.

**params**:

* `agendaItem`: The [EventAgendaItem](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_agenda_item/EventAgendaItem-class.html) to be edited.
* `categories`: List of all available [AgendaCategory](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_agenda_category/AgendaCategory-class.html) for the event.

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
2. [edit\_agenda\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3. [EditAgendaItemViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. initialize method

##### EditAgendaItemViewModel class





talawa
1.0.0+1






