




EditProfilePageViewModel class - edit\_profile\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/profile\_view\_models/edit\_profile\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3. EditProfilePageViewModel class

EditProfilePageViewModel


dark\_mode

light\_mode




# EditProfilePageViewModel class


EditProfilePageViewModel class helps to interact with model to serve data to edit profile views.

Methods include:

* `getImageFromGallery`

## Constructors

[EditProfilePageViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/EditProfilePageViewModel.html)()




## Properties

[base64Image](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/base64Image.html)
↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

profile image in base64.
getter/setter pair

[databaseService](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/databaseService.html)
→ dynamic

Graphql client.
final

[firstNameFocus](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/firstNameFocus.html)
↔ dynamic

Focus node tpo control focus.
getter/setter pair

[firstNameTextController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/firstNameTextController.html)
↔ dynamic

first name controller.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[imageFile](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/imageFile.html)
↔ [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?

profile image.
getter/setter pair

[lastNameFocus](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/lastNameFocus.html)
↔ dynamic

Focus node tpo control focus.
getter/setter pair

[lastNameTextController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/lastNameTextController.html)
↔ dynamic

last name controller.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[user](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/user.html)
→ dynamic

current user.
final

[userProfileService](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/userProfileService.html)
→ dynamic

GetIt of user profile service.
final



## Methods

[convertToBase64](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/convertToBase64.html)([File](https://api.flutter.dev/flutter/dart-io/File-class.html) file)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html)>


This function is used to convert the image into Base64 format.

[initialize](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/initialize.html)()
→ void


initialization function.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[removeImage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/removeImage.html)()
→ void


This function remove the selected image.

[selectImage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/selectImage.html)({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) camera = false})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function is used to get the image from gallery.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[updateUserProfile](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/updateUserProfile.html)({[String](https://api.flutter.dev/flutter/dart-core/String-class.html)? firstName, [String](https://api.flutter.dev/flutter/dart-core/String-class.html)? lastName, [File](https://api.flutter.dev/flutter/dart-io/File-class.html)? newImage})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Method to update user profile.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [edit\_profile\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3. EditProfilePageViewModel class

##### edit\_profile\_view\_model library





talawa
1.0.0+1






