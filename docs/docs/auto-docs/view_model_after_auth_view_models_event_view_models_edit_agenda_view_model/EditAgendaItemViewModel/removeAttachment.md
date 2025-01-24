




removeAttachment method - EditAgendaItemViewModel class - edit\_agenda\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/edit\_agenda\_view\_model.dart](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/view_model_after_auth_view_models_event_view_models_edit_agenda_view_model-library.html)
3. [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. removeAttachment method

removeAttachment


dark\_mode

light\_mode




# removeAttachment method


void
removeAttachment(

1. String image

)

Removes an attachment from the agenda item.

**params**:

* `image`: The base64 string representing the attachment to be removed.

**returns**:
None


## Implementation

```
void removeAttachment(String image) {
  _currentAttachments.remove(image);
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [edit\_agenda\_view\_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/view_model_after_auth_view_models_event_view_models_edit_agenda_view_model-library.html)
3. [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. removeAttachment method

##### EditAgendaItemViewModel class





talawa
1.0.0+1






