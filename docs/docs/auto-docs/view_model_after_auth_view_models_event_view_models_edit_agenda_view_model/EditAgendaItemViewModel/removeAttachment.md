
<div>

# removeAttachment method

</div>


void removeAttachment(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    image]

)



Removes an attachment from the agenda item.

**params**:

-   `image`: The base64 string representing the attachment to be
    removed.

**returns**: None



## Implementation

``` language-dart
void removeAttachment(String image) {
  _currentAttachments.remove(image);
  ;
}
```







1.  [talawa](../../index.html)
2.  [edit_agenda_view_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4.  removeAttachment method

##### EditAgendaItemViewModel class







