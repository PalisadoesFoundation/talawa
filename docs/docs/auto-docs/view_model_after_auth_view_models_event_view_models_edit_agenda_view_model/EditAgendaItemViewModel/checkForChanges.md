




checkForChanges method - EditAgendaItemViewModel class - edit\_agenda\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/edit\_agenda\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/view_model_after_auth_view_models_event_view_models_edit_agenda_view_model-library.html)
3. [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. checkForChanges method

checkForChanges


dark\_mode

light\_mode




# checkForChanges method


bool
checkForChanges()

Checks if there are any unsaved changes in the form.

**params**:
None

**returns**:

* `bool`: define\_the\_return

## Implementation

```
bool checkForChanges() {
  final bool titleChanged = titleController.text != (_agendaItem.title ?? '');
  final bool descriptionChanged =
      descriptionController.text != (_agendaItem.description ?? '');
  final bool durationChanged =
      durationController.text != (_agendaItem.duration ?? '');

  final selectedCategoryIds =
      _selectedCategories.map((cat) => cat.id).toSet();
  final agendaCategoryIds =
      _agendaItem.categories?.map((cat) => cat.id).toSet() ?? {};
  final bool categoriesChanged =
      !setEquals(selectedCategoryIds, agendaCategoryIds);

  final bool urlsChanged = !listEquals(_initialUrls, _currentUrls);
  final bool attachmentsChanged =
      !listEquals(_initialAttachments, _currentAttachments);

  final bool hasChange = titleChanged ||
      descriptionChanged ||
      durationChanged ||
      categoriesChanged ||
      urlsChanged ||
      attachmentsChanged;

  return hasChange;
}
```

 


1. [talawa](../../index.html)
2. [edit\_agenda\_view\_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/view_model_after_auth_view_models_event_view_models_edit_agenda_view_model-library.html)
3. [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. checkForChanges method

##### EditAgendaItemViewModel class





talawa
1.0.0+1






