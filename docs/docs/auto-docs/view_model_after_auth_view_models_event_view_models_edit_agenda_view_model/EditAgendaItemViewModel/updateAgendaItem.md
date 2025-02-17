
<div>

# updateAgendaItem method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Updates the agenda item with the modified values.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  try {
    if (!) return;
    final List<String> attachmentPaths = _currentAttachments;
    final List<String> categoryIds =
        _selectedCategories.map((category) => category.id!).;

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







1.  [talawa](../../index.html)
2.  [edit_agenda_view_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4.  updateAgendaItem method

##### EditAgendaItemViewModel class







