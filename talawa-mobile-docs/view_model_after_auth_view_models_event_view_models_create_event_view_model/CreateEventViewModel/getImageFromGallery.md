


# getImageFromGallery method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getImageFromGallery
({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) camera = false})





<p>This function is used to get the image from gallery.</p>
<p>The function uses the <code>_multiMediaPickerService</code> services.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>camera</code>: if true then open camera for image, else open gallery to select image.</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;void&gt;</code>: Asynchronous function for getting image from gallery</li>
</ul>



## Implementation

```dart
Future<void> getImageFromGallery({bool camera = false}) async {
  final image =
      await _multiMediaPickerService.getPhotoFromGallery(camera: camera);
  if (image != null) {
    _imageFile = image;
    notifyListeners();
  }
}
```







