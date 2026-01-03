# Overview for `ImageService`

## Description

ImageService class provides different functions as service in the context of Images.

 Services include:
 * `cropImage`
 * `convertToBase64`
 * `uploadFileToMinio`
 * `getFileFromMinio`
 * `calculateFileHash`

## Members

- **_imageCropper**: `ImageCropper`
  Global instance of ImageCropper.

- **_databaseMutationFunctions**: `dynamic`
  Database mutation service instance

