




pickAttachment method - EditAgendaItemViewModel class - edit\_agenda\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/event\_view\_models/edit\_agenda\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3. [EditAgendaItemViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. pickAttachment method

pickAttachment


dark\_mode

light\_mode




# pickAttachment method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
pickAttachment({

1. [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) fromCamera = false,

})

Picks an attachment for the agenda item from the gallery or camera.

**params**:

* `fromCamera`: If `true`, opens the camera to pick an image, otherwise opens the gallery.

**returns**:
None


## Implementation

```
Future<void> pickAttachment({bool fromCamera = false}) async {
  final File? pickedFile =
      await _multiMediaPickerService.getPhotoFromGallery(camera: fromCamera);
  if (pickedFile != null) {
    final base64PickedFile = await imageService.convertToBase64(pickedFile);
    _currentAttachments.add(base64PickedFile);
    notifyListeners();
  }
}
```

 


1. [talawa](../../index.html)
2. [edit\_agenda\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3. [EditAgendaItemViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4. pickAttachment method

##### EditAgendaItemViewModel class





talawa
1.0.0+1






