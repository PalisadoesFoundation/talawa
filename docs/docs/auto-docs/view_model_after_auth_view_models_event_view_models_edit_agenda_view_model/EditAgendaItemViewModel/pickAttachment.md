
<div>

# pickAttachment method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
pickAttachment({

1.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.md)]
    fromCamera = false,
    ]

})



Picks an attachment for the agenda item from the gallery or camera.

**params**:

-   `fromCamera`: If `true`, opens the camera to pick an image,
    otherwise opens the gallery.

**returns**: None



## Implementation

``` language-dart
Future<void> pickAttachment({bool fromCamera = false}) async {
  final File? pickedFile =
      await _multiMediaPickerService.getPhotoFromGallery(camera: fromCamera);
  if (pickedFile != null) {
    final base64PickedFile = await imageService.convertToBase64(pickedFile);
    _currentAttachments.add(base64PickedFile);
    ;
  }
}
```







1.  [talawa](../../index.md)
2.  [edit_agenda_view_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.md)
4.  pickAttachment method

##### EditAgendaItemViewModel class







