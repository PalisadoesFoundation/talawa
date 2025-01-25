




setSelectedCategories method - EditAgendaItemViewModel class - edit\_agenda\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/edit\_agenda\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3. [EditAgendaItemViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. setSelectedCategories method

setSelectedCategories


dark\_mode

light\_mode




# setSelectedCategories method


void
setSelectedCategories(

1. [List](https://api.flutter.dev/flutter/dart-core/List-class.html) categories

)

Updates the selected categories in the form.

**params**:

* `categories`: The list of selected [AgendaCategory](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_events_event_agenda_category/AgendaCategory-class.html).

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
2. [edit\_agenda\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3. [EditAgendaItemViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. setSelectedCategories method

##### EditAgendaItemViewModel class





talawa
1.0.0+1






