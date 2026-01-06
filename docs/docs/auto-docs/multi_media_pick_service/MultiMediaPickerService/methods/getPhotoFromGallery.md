# Method: `getPhotoFromGallery`

## Description

Picks the image from gallery or to click the image from user's camera.

 First ask for the permission to access the camera, if denied then returns a message in.
 custom Dialog Box. Returns a File type for which `camera` variable is false by default.

 **params**:
 * `camera`: if true then open camera for image, else open gallery to select image.

 **returns**:
 * `Future<File?>`: the image the user choosed.

## Return Type
`Future<File?>`

## Parameters

- ``: `dynamic`
