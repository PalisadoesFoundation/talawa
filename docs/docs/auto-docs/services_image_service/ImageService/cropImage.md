




cropImage method - ImageService class - image\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/image\_service.dart](../../services_image_service/services_image_service-library.html)
3. [ImageService](../../services_image_service/ImageService-class.html)
4. cropImage method

cropImage


dark\_mode

light\_mode




# cropImage method


Future<File?>
cropImage({

1. required File imageFile,

})

Crops the image selected by the user.

**params**:

* `imageFile`: the image file to be cropped.

**returns**:

* `Future<File?>`: the image after been cropped.

**throws**:

* `Exception`: If an error occurs during the image cropping process.

## Implementation

```
Future<File?> cropImage({required File imageFile}) async {
  // try, to crop the image and returns a File with cropped image path.
  try {
    final CroppedFile? croppedImage = await _imageCropper.cropImage(
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
        ),
      ],
    );

    if (croppedImage != null) {
      return File(croppedImage.path);
    }
  } catch (e) {
    throw Exception(
      "ImageService : $e.",
    );
  }

  return null;
}
```

 


1. [talawa](../../index.html)
2. [image\_service](../../services_image_service/services_image_service-library.html)
3. [ImageService](../../services_image_service/ImageService-class.html)
4. cropImage method

##### ImageService class





talawa
1.0.0+1






