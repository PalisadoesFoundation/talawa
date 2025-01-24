




EditProfilePageViewModel class - edit\_profile\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/profile\_view\_models/edit\_profile\_view\_model.dart](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/view_model_after_auth_view_models_profile_view_models_edit_profile_view_model-library.html)
3. EditProfilePageViewModel class

EditProfilePageViewModel


dark\_mode

light\_mode




# EditProfilePageViewModel class


EditProfilePageViewModel class helps to interact with model to serve data to edit profile views.

Methods include:

* `getImageFromGallery`

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* EditProfilePageViewModel



## Constructors

[EditProfilePageViewModel](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/EditProfilePageViewModel.html)()




## Properties

[base64Image](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/base64Image.html)
↔ String?

profile image in base64.
getter/setter pair

[databaseService](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/databaseService.html)
→ [DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions-class.html)

Graphql client.
final

[firstNameFocus](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/firstNameFocus.html)
↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

Focus node tpo control focus.
getter/setter pair

[firstNameTextController](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/firstNameTextController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

first name controller.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[imageFile](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/imageFile.html)
↔ File?

profile image.
getter/setter pair

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[lastNameFocus](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/lastNameFocus.html)
↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)

Focus node tpo control focus.
getter/setter pair

[lastNameTextController](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/lastNameTextController.html)
↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

last name controller.
getter/setter pair

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[user](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/user.html)
→ [User](../models_user_user_info/User-class.html)

current user.
final

[userProfileService](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/userProfileService.html)
→ [UserProfileService](../services_user_profile_service/UserProfileService-class.html)

GetIt of user profile service.
final



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[convertToBase64](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/convertToBase64.html)(File file)
→ Future<String>


This function is used to convert the image into Base64 format.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[initialize](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/initialize.html)()
→ void


initialization function.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[removeImage](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/removeImage.html)()
→ void


This function remove the selected image.

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[selectImage](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/selectImage.html)({bool camera = false})
→ Future<void>


This function is used to get the image from gallery.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited

[updateUserProfile](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/updateUserProfile.html)({String? firstName, String? lastName, File? newImage})
→ Future<void>


Method to update user profile.



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [edit\_profile\_view\_model](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/view_model_after_auth_view_models_profile_view_models_edit_profile_view_model-library.html)
3. EditProfilePageViewModel class

##### edit\_profile\_view\_model library





talawa
1.0.0+1






