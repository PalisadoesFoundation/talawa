
<div>

# checkForChanges method

</div>


[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]




Checks if there are any unsaved changes in the form.

**params**: None

**returns**:

-   `bool`: define_the_return



## Implementation

``` language-dart
bool  {
  final bool titleChanged = titleController.text != (_agendaItem.title ?? '');
  final bool descriptionChanged =
      descriptionController.text != (_agendaItem.description ?? '');
  final bool durationChanged =
      durationController.text != (_agendaItem.duration ?? '');

  final selectedCategoryIds =
      _selectedCategories.map((cat) => cat.id).;
  final agendaCategoryIds =
      _agendaItem.categories?.map((cat) => cat.id). ?? {};
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







1.  [talawa](../../index.html)
2.  [edit_agenda_view_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4.  checkForChanges method

##### EditAgendaItemViewModel class







