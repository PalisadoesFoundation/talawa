# Overview for `MultiMediaPickerService`

## Description

This is a third party service which provide the service to select the image from.

 gallery and then image can be cropped as well.

 Services include:
 * `getPhotoFromGallery` - Used to select photo from gallery.
 * `cropImage` - Used to crop the selected image.

## Members

- **_fileStreamController**: `StreamController&lt;File&gt;`
  Controller for handling the stream of selected files.

- **maxImageSizeAllowed**: `dynamic`
  Maximum size allowed for image upload in mb.

- **compressImageFunction**: `Future<XFile?> Function(String, String, )`
  Function for compressing the image.

- **_fileStream**: `Stream&lt;File&gt;`
  Stream of selected files.

- **_picker**: `ImagePicker`
  [ImagePicker] used for selecting images or videos.

- **_imageService**: `ImageService`
  [ImageService] for additional image-related operations.

- **navigationService**: `dynamic`
  Navigation service for the app.

## Constructors

### Unnamed Constructor


