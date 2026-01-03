# Overview for `EditProfilePageViewModel`

## Description

EditProfilePageViewModel class helps to interact with model to serve data to edit profile views.

 Methods include:
 * `getImageFromGallery`

## Dependencies

- BaseModel

## Members

- **user**: `dynamic`
  current user.

- **_multiMediaPickerService**: `MultiMediaPickerService`
- **imageFile**: `File?`
  profile image.

- **nameTextController**: `TextEditingController`
  first name controller.

- **emailTextController**: `TextEditingController`
  email controller.

- **nameFocus**: `FocusNode`
  Focus node tpo control focus.

- **emailFocus**: `FocusNode`
  Focus node to control focus.

- **databaseService**: `dynamic`
  Graphql client.

- **userProfileService**: `dynamic`
  GetIt of user profile service.

