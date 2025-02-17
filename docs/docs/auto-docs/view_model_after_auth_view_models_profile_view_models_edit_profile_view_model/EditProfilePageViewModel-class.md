
<div>

# EditProfilePageViewModel class

</div>


EditProfilePageViewModel class helps to interact with model to serve
data to edit profile views.

Methods include:

-   `getImageFromGallery`




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   EditProfilePageViewModel



## Constructors

[EditProfilePageViewModel](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/EditProfilePageViewModel.html)

:   



## Properties

[[base64Image](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/base64Image.html)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   profile image in base64.
    ::: features
    getter/setter pair
    :::

[[databaseService](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/databaseService.html)] [→ [DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions-class.html)]
:   Graphql client.
    ::: features
    final
    :::

[[firstNameFocus](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/firstNameFocus.html)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   Focus node tpo control focus.
    ::: features
    getter/setter pair
    :::

[[firstNameTextController](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/firstNameTextController.html)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   first name controller.
    ::: features
    getter/setter pair
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
:   The hash code for this object.
    ::: features
    no setterinherited
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether any listeners are currently registered.
    ::: features
    no setterinherited
    :::

[[imageFile](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/imageFile.html)] [↔ [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]
:   profile image.
    ::: features
    getter/setter pair
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[lastNameFocus](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/lastNameFocus.html)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   Focus node tpo control focus.
    ::: features
    getter/setter pair
    :::

[[lastNameTextController](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/lastNameTextController.html)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   last name controller.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)] [→ [ViewState](../enums_enums/ViewState.html)]

:   ::: features
    no setterinherited
    :::

[[user](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/user.html)] [→ [User](../models_user_user_info/User-class.html)]
:   current user.
    ::: features
    final
    :::

[[userProfileService](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/userProfileService.html)] [→ [UserProfileService](../services_user_profile_service/UserProfileService-class.html)]
:   GetIt of user profile service.
    ::: features
    final
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[convertToBase64](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/convertToBase64.html)][([[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)] file]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]] ]
:   This function is used to convert the image into Base64 format.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[initialize](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/initialize.html) [→ void ]
:   initialization function.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[removeImage](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/removeImage.html) [→ void ]
:   This function remove the selected image.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[selectImage](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/selectImage.html)][({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] camera = false]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to get the image from gallery.

[[setState](../view_model_base_view_model/BaseModel/setState.html)][([[[ViewState](../enums_enums/ViewState.html)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateUserProfile](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/updateUserProfile.html)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] firstName, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] lastName, ][[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?] newImage]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to update user profile.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [edit_profile_view_model](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3.  EditProfilePageViewModel class

##### edit_profile_view_model library







