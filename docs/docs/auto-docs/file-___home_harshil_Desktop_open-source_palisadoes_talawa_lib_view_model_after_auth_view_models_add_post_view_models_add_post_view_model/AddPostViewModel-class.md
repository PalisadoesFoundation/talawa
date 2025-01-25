




AddPostViewModel class - add\_post\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/add\_post\_view\_models/add\_post\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3. AddPostViewModel class

AddPostViewModel


dark\_mode

light\_mode




# AddPostViewModel class


AddPostViewModel class have different functions.

They are used to interact with the model to add a new post in the
organization.


## Constructors

[AddPostViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/AddPostViewModel.html)({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) demoMode = false})




## Properties

[controller](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/controller.html)
→ dynamic

The main text controller of the post body.
no setter

[demoMode](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/demoMode.html)
↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)

Whether the app is running in Demo Mode.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[imageFile](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/imageFile.html)
→ [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?

The image file that is to be uploaded.
no setter

[imageInBase64](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/imageInBase64.html)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

Getter to access the base64 type.
no setter

[orgName](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/orgName.html)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

The organisation name.
no setter

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited

[textHashTagController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/textHashTagController.html)
→ dynamic

The main text controller of the hashtag.
no setter

[titleController](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/titleController.html)
→ dynamic

The text controller of the title body.
no setter

[userName](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/userName.html)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

The username of the currentUser.
no setter

[userPic](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/userPic.html)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?

User profile picture.
no setter



## Methods

[getImageFromGallery](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/getImageFromGallery.html)({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) camera = false})
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function is used to get the image from gallery.

[initialise](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/initialise.html)()
→ void


This function is usedto do initialisation of stuff in the view model.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[removeImage](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/removeImage.html)()
→ void


This function removes the image selected.

[setImageFile](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/setImageFile.html)([File](https://api.flutter.dev/flutter/dart-io/File-class.html)? file)
→ void


Method to set image.

[setImageInBase64](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/setImageInBase64.html)([File](https://api.flutter.dev/flutter/dart-io/File-class.html) file)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


Method to set Image in Bsse64.

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited

[uploadPost](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/uploadPost.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function uploads the post finally, and navigate the success message or error message in Snack Bar.



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [add\_post\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3. AddPostViewModel class

##### add\_post\_view\_model library





talawa
1.0.0+1






