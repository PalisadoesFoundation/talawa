:::::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_add_post_view_models_add_post_view_model/view_model_after_auth_view_models_add_post_view_models_add_post_view_model-library-sidebar.html" below-sidebar="view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel-class-sidebar.html"}
<div>

# [AddPostViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
AddPostViewModel class have different functions.

They are used to interact with the model to add a new post in the
organization.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   AddPostViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[AddPostViewModel](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/AddPostViewModel.html)]{.name}[({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [demoMode]{.parameter-name} = [false]{.default-value}]{#-param-demoMode .parameter}})]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[controller](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/controller.html)]{.name} [→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   The main text controller of the post body.
    ::: features
    [no setter]{.feature}
    :::

[[demoMode](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/demoMode.html)]{.name} [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Whether the app is running in Demo Mode.
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

[[imageFile](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/imageFile.html)]{.name} [→ [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]{.signature}
:   The image file that is to be uploaded.
    ::: features
    [no setter]{.feature}
    :::

[[imageInBase64](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/imageInBase64.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   Getter to access the base64 type.
    ::: features
    [no setter]{.feature}
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[orgName](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/orgName.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   The organisation name.
    ::: features
    [no setter]{.feature}
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

[[textHashTagController](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/textHashTagController.html)]{.name} [→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   The main text controller of the hashtag.
    ::: features
    [no setter]{.feature}
    :::

[[titleController](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/titleController.html)]{.name} [→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]{.signature}
:   The text controller of the title body.
    ::: features
    [no setter]{.feature}
    :::

[[userName](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/userName.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   The username of the currentUser.
    ::: features
    [no setter]{.feature}
    :::

[[userPic](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/userPic.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.signature}
:   User profile picture.
    ::: features
    [no setter]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [inherited]{.feature}
    :::

[[getImageFromGallery](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/getImageFromGallery.html)]{.name}[({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [camera]{.parameter-name} = [false]{.default-value}]{#getImageFromGallery-param-camera .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to get the image from gallery.

[[initialise](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/initialise.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function is usedto do initialisation of stuff in the view
    model.

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

[[removeImage](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/removeImage.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   This function removes the image selected.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[setImageFile](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/setImageFile.html)]{.name}[([[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]{.type-annotation} [file]{.parameter-name}]{#setImageFile-param-file .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Method to set image.

[[setImageInBase64](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/setImageInBase64.html)]{.name}[([[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)]{.type-annotation} [file]{.parameter-name}]{#setImageInBase64-param-file .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to set Image in Bsse64.

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[uploadPost](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/uploadPost.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function uploads the post finally, and navigate the success
    message or error message in Snack Bar.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [add_post_view_model](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3.  AddPostViewModel class

##### add_post_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
