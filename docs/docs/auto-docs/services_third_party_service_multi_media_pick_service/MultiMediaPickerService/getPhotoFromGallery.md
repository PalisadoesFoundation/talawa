
<div>

# getPhotoFromGallery method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]\>]]
getPhotoFromGallery({

1.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
    camera = false,
    ]

})



Picks the image from gallery or to click the image from user\'s camera.

First ask for the permission to access the camera, if denied then
returns a message in. custom Dialog Box. Returns a File type for which
`camera` variable is false by default.

**params**:

-   `camera`: if true then open camera for image, else open gallery to
    select image.

**returns**:

-   `Future<File?>`: the image the user choosed.



## Implementation

``` language-dart
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
        ,
      );
    }
    debugPrint(
      "MultiMediaPickerService : Exception occurred while choosing photo from the gallery $e",
    );
  }

  return null;
}
```







1.  [talawa](../../index.html)
2.  [multi_media_pick_service](../../services_third_party_service_multi_media_pick_service/)
3.  [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.html)
4.  getPhotoFromGallery method

##### MultiMediaPickerService class







