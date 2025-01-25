




updateAgendaItem method - EditAgendaItemViewModel class - edit\_agenda\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/edit\_agenda\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3. [EditAgendaItemViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. updateAgendaItem method

updateAgendaItem


dark\_mode

light\_mode




# updateAgendaItem method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
updateAgendaItem()

Updates the agenda item with the modified values.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> updateAgendaItem() async {
  try {
    if (!checkForChanges()) return;
    final List<String> attachmentPaths = _currentAttachments;
    final List<String> categoryIds =
        _selectedCategories.map((category) => category.id!).toList();

    final updatedAgendaItem = {
      'title': titleController.text,
      'description': descriptionController.text,
      'duration': durationController.text,
      'attachments': attachmentPaths,
      'urls': _currentUrls,
      'categories': categoryIds,
    };

    await _eventService.updateAgendaItem(
      _agendaItem.id!,
      updatedAgendaItem,
    ) as QueryResult<Object?>;
  } catch (e) {
    print('Error updating agenda item: $e');
  }
}
```

 


1. [talawa](../../index.html)
2. [edit\_agenda\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3. [EditAgendaItemViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. updateAgendaItem method

##### EditAgendaItemViewModel class





talawa
1.0.0+1






