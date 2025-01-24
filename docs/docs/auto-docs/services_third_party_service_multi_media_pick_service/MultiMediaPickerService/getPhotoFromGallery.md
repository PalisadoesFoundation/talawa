




getPhotoFromGallery method - MultiMediaPickerService class - multi\_media\_pick\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/third\_party\_service/multi\_media\_pick\_service.dart](../../services_third_party_service_multi_media_pick_service/services_third_party_service_multi_media_pick_service-library.html)
3. [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.html)
4. getPhotoFromGallery method

getPhotoFromGallery


dark\_mode

light\_mode




# getPhotoFromGallery method


Future<File?>
getPhotoFromGallery({

1. bool camera = false,

})

Picks the image from gallery or to click the image from user's camera.

First ask for the permission to access the camera, if denied then returns a message in.
custom Dialog Box. Returns a File type for which `camera` variable is false by default.

**params**:

* `camera`: if true then open camera for image, else open gallery to select image.

**returns**:

* `Future<File?>`: the image the user choosed.

## Implementation

```
Future<File?> getPhotoFromGallery({bool camera = false}) async {
  // asking for user's camera access permission.
  try {
    // checking for the image source, it could be camera or gallery.
    final image = await _picker.pickImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
    );
    // if image is selected or not null, call the cropImage function that provide service to crop the selected image.
    if (image != null) {
      return await _imageService.cropImage(
        imageFile: File(image.path),
      );
    }
  } catch (e) {
    // if the permission denied or error occurs.
    if (e is PlatformException && e.code == 'camera_access_denied') {
      // push the dialog alert with the message.
      locator<NavigationService>().pushDialog(
        permissionDeniedDialog(),
      );
    }
    debugPrint(
      "MultiMediaPickerService : Exception occurred while choosing photo from the gallery $e",
    );
  }

  return null;
}
```

 


1. [talawa](../../index.html)
2. [multi\_media\_pick\_service](../../services_third_party_service_multi_media_pick_service/services_third_party_service_multi_media_pick_service-library.html)
3. [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.html)
4. getPhotoFromGallery method

##### MultiMediaPickerService class





talawa
1.0.0+1






