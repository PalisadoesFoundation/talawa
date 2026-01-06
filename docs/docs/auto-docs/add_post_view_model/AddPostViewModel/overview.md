# Overview for `AddPostViewModel`

## Description

AddPostViewModel class have different functions.

 They are used to interact with the model to add a new post in the
  organization.

## Dependencies

- BaseModel

## Members

- **maxImages**: `int`
  Maximum number of images allowed per post..

- **_multiMediaPickerService**: `MultiMediaPickerService`
- **_navigationService**: `NavigationService`
- **_imageService**: `ImageService`
- **imageFiles**: `List&lt;File&gt;`
  List of image files to be uploaded.

- **_selectedOrg**: `OrgInfo`
  The organization ID for which to fetch the presigned URL.

- **captionController**: `TextEditingController`
  Controller for caption text field.

- **_dbFunctions**: `DataBaseMutationFunctions`
  The database functions instance.

## Constructors

### Unnamed Constructor


