


# getPhotoFromGallery method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?> getPhotoFromGallery
({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) camera = false})





<p>This function is used to pick the image from gallery or to click the image from user's camera.</p>
<p>The function first ask for the permission to access the camera, if denied then returns a message in.</p>
<p>custom Dialog Box. This function returns a File type for which <code>camera</code> variable is false by default.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>camera</code>: if true then open camera for image, else open gallery to select image.</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;File?&gt;</code>: the image the user choosed.</li>
</ul>



## Implementation

```dart
Future<File?> getPhotoFromGallery({bool camera = false}) async {
  // asking for user's camera access permission.
  try {
    // checking for the image source, it could be camera or gallery.
    final image = await _picker.pickImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
    );
    // if image is selected or not null, call the cropImage function that provide service to crop the selected image.
    if (image != null) {
      return await cropImage(imageFile: File(image.path));
    }
  } catch (e) {
    // if the permission denied or error occurs.
    if (e is PlatformException && e.code == 'camera_access_denied') {
      // push the dialog alert with the message.
      locator<NavigationService>().pushDialog(
        CustomAlertDialog(
          success: () {
            locator<NavigationService>().pop();
            openAppSettings();
          },
          dialogTitle: 'Permission Denied',
          successText: 'SETTINGS',
          dialogSubTitle:
              "Camera permission is required, to use this feature, give permission from app settings",
        ),
      );
    }
    print(
      "MultiMediaPickerService : Exception occurred while choosing photo from the gallery $e",
    );
  }
  return null;
}
```







