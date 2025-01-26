::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [view_model/after_auth_view_models/profile_view_models/edit_profile_view_model.dart](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3.  EditProfilePageViewModel class

::: self-name
EditProfilePageViewModel
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/view_model_after_auth_view_models_profile_view_models_edit_profile_view_model-library-sidebar.html" below-sidebar="view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel-class-sidebar.html"}
<div>

# [EditProfilePageViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
EditProfilePageViewModel class helps to interact with model to serve
data to edit profile views.

Methods include:

-   `getImageFromGallery`
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   EditProfilePageViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[EditProfilePageViewModel](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/EditProfilePageViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[base64Image](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/base64Image.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   profile image in base64.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[databaseService](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/databaseService.html)]{.name} [→ [DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions-class.html)]{.signature}
:   Graphql client.
    ::: features
    [final]{.feature}
    :::

[[firstNameFocus](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/firstNameFocus.html)]{.name} [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]{.signature}
:   Focus node tpo control focus.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[firstNameTextController](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/firstNameTextController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   first name controller.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Whether any listeners are currently registered.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[imageFile](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/imageFile.html)]{.name} [↔ [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]{.signature}
:   profile image.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[lastNameFocus](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/lastNameFocus.html)]{.name} [↔ [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)]{.signature}
:   Focus node tpo control focus.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[lastNameTextController](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/lastNameTextController.html)]{.name} [↔ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   last name controller.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[state](../view_model_base_view_model/BaseModel/state.html)]{.name} [→ [ViewState](../enums_enums/ViewState.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[user](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/user.html)]{.name} [→ [User](../models_user_user_info/User-class.html)]{.signature}
:   current user.
    ::: features
    [final]{.feature}
    :::

[[userProfileService](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/userProfileService.html)]{.name} [→ [UserProfileService](../services_user_profile_service/UserProfileService-class.html)]{.signature}
:   GetIt of user profile service.
    ::: features
    [final]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[convertToBase64](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/convertToBase64.html)]{.name}[([[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)]{.type-annotation} [file]{.parameter-name}]{#convertToBase64-param-file .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to convert the image into Base64 format.

[[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [inherited]{.feature}
    :::

[[initialize](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/initialize.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   initialization function.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Call all the registered listeners.
    ::: features
    [inherited]{.feature}
    :::

[[removeImage](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/removeImage.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function remove the selected image.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[selectImage](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/selectImage.html)]{.name}[({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [camera]{.parameter-name} = [false]{.default-value}]{#selectImage-param-camera .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to get the image from gallery.

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[updateUserProfile](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/EditProfilePageViewModel/updateUserProfile.html)]{.name}[({[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [firstName]{.parameter-name}, ]{#updateUserProfile-param-firstName .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [lastName]{.parameter-name}, ]{#updateUserProfile-param-lastName .parameter}[[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]{.type-annotation} [newImage]{.parameter-name}]{#updateUserProfile-param-newImage .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to update user profile.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [edit_profile_view_model](../view_model_after_auth_view_models_profile_view_models_edit_profile_view_model/)
3.  EditProfilePageViewModel class

##### edit_profile_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
