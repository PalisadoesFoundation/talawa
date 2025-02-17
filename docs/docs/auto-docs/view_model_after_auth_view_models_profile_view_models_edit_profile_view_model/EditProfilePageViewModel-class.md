
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
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   EditProfilePageViewModel



## Constructors

[EditProfilePageViewModel](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/EditProfilePageViewModel.md)

:   



## Properties

[[base64Image](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/base64Image.md)] [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   profile image in base64.
    ::: features
    getter/setter pair
    :::

[[databaseService](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/databaseService.md)] [→ [DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions-class.md)]
:   Graphql client.
    ::: features
    final
    :::

[[firstNameFocus](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/firstNameFocus.md)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   Focus node tpo control focus.
    ::: features
    getter/setter pair
    :::

[[firstNameTextController](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/firstNameTextController.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
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

[[imageFile](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/imageFile.md)] [↔ [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]
:   profile image.
    ::: features
    getter/setter pair
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[lastNameFocus](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/lastNameFocus.md)] [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]
:   Focus node tpo control focus.
    ::: features
    getter/setter pair
    :::

[[lastNameTextController](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/lastNameTextController.md)] [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   last name controller.
    ::: features
    getter/setter pair
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)] [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]
:   A representation of the runtime type of the object.
    ::: features
    no setterinherited
    :::

[[state](../view_model_base_view_model/BaseModel/state.md)] [→ [ViewState](../enums_enums/ViewState.md)]

:   ::: features
    no setterinherited
    :::

[[user](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/user.md)] [→ [User](../models_user_user_info/User-class.md)]
:   current user.
    ::: features
    final
    :::

[[userProfileService](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/userProfileService.md)] [→ [UserProfileService](../services_user_profile_service/UserProfileService-class.md)]
:   GetIt of user profile service.
    ::: features
    final
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[convertToBase64](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/convertToBase64.md)][([[[File](https://api.flutter.dev/flutter/dart-io/File-class.md)] file]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]\>]] ]
:   This function is used to convert the image into Base64 format.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[initialize](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/initialize.md) [→ void ]
:   initialization function.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)][([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.md)] invocation]) → dynamic ]
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    inherited
    :::

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html) [→ void ]
:   Call all the registered listeners.
    ::: features
    inherited
    :::

[removeImage](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/removeImage.md) [→ void ]
:   This function remove the selected image.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[selectImage](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/selectImage.md)][({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.md)] camera = false]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to get the image from gallery.

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updateUserProfile](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/updateUserProfile.md)][({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)?] firstName, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?] lastName, ][[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?] newImage]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to update user profile.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [edit_profile_view_model](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3.  EditProfilePageViewModel class

##### edit_profile_view_model library







