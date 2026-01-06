# Overview for `CreateAgendaItemPageState`

## Description

State class for [CreateAgendaItemPage].

## Dependencies

- State

## Members

- **titleController**: `TextEditingController`
  Controller for the agenda item title input field.

- **descController**: `TextEditingController`
  Controller for the agenda item description input field.

- **urlController**: `TextEditingController`
  Controller for the URL input field.

- **durationController**: `TextEditingController`
  Controller for the duration input field.

- **titleFocus**: `FocusNode`
  Focus node for the title input field.

- **descFocus**: `FocusNode`
  Focus node for the description input field.

- **urlFocus**: `FocusNode`
  Focus node for the URL input field.

- **durationFocus**: `FocusNode`
  Focus node for the duration input field.

- **selectedCategories**: `List&lt;AgendaCategory&gt;`
  List of selected categories for the agenda item.

- **urls**: `List&lt;String&gt;`
  List of URLs associated with the agenda item.

- **attachments**: `List&lt;String&gt;`
  List of base64 encoded attachments associated with the agenda item.

- **_multiMediaPickerService**: `MultiMediaPickerService`
  Service for picking multimedia files.

