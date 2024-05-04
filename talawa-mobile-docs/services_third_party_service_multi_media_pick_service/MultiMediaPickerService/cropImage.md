


# cropImage method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?> cropImage
({required [File](https://api.flutter.dev/flutter/dart-io/File-class.html) imageFile})





<p>This function is used to crop the image selected by the user.</p>
<p>The function accepts a <code>File</code> type image and returns <code>File</code> type of cropped image.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>imageFile</code>: the image file to be cropped.</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;File?&gt;</code>: the image after been cropped.</li>
</ul>



## Implementation

```dart
Future<File?> cropImage({required File imageFile}) async {
  // try, to crop the image and returns a File with cropped image path.
  try {
    final CroppedFile? croppedImage = await locator<ImageCropper>().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.original,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: const Color(0xff18191A),
          toolbarWidgetColor: Colors.white,
          backgroundColor: Colors.black,
          cropGridColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
      ],
    );
    if (croppedImage != null) {
      return File(croppedImage.path);
    }
  } catch (e) {
    print(
      "MultiMediaPickerService : Exception occurred while cropping Image",
    );
  }
  return null;
}
```







