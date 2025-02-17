::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [updateAgendaItem]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[updateAgendaItem]{.name}()
:::

::: {.section .desc .markdown}
Updates the agenda item with the modified values.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [edit_agenda_view_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4.  updateAgendaItem method

##### EditAgendaItemViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
