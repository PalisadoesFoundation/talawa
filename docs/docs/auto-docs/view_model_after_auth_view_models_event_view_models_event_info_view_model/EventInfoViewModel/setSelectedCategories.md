




setSelectedCategories method - EventInfoViewModel class - event\_info\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/event\_info\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. setSelectedCategories method

setSelectedCategories


dark\_mode

light\_mode




# setSelectedCategories method


void
setSelectedCategories(

1. List<[AgendaCategory](../../models_events_event_agenda_category/AgendaCategory-class.html)> categories

)

method to select multiple categories.

**params**:

* `categories`: define\_the\_param

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
2. [event\_info\_view\_model](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/view_model_after_auth_view_models_event_view_models_event_info_view_model-library.html)
3. [EventInfoViewModel](../../view_model_after_auth_view_models_event_view_models_event_info_view_model/EventInfoViewModel-class.html)
4. setSelectedCategories method

##### EventInfoViewModel class





talawa
1.0.0+1






