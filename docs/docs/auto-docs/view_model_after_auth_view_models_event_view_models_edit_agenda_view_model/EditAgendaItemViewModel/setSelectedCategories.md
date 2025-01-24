




setSelectedCategories method - EditAgendaItemViewModel class - edit\_agenda\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/edit\_agenda\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/view_model_after_auth_view_models_event_view_models_edit_agenda_view_model-library.html)
3. [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. setSelectedCategories method

setSelectedCategories


dark\_mode

light\_mode




# setSelectedCategories method


void
setSelectedCategories(

1. List<[AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.html)> categories

)

Updates the selected categories in the form.

**params**:

* `categories`: The list of selected [AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.html).

**returns**:
None


## Implementation

```
void setSelectedCategories(List<AgendaCategory> categories) {
  _selectedCategories = categories;
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [edit\_agenda\_view\_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/view_model_after_auth_view_models_event_view_models_edit_agenda_view_model-library.html)
3. [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. setSelectedCategories method

##### EditAgendaItemViewModel class





talawa
1.0.0+1






