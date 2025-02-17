
<div>

# AddPostViewModel class

</div>


AddPostViewModel class have different functions.

They are used to interact with the model to add a new post in the
organization.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.md)
    -   AddPostViewModel



## Constructors

[[AddPostViewModel](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/AddPostViewModel.md)][({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.md)] demoMode = false]})]

:   



## Properties

[[controller](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/controller.md)] [→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   The main text controller of the post body.
    ::: features
    no setter
    :::

[[demoMode](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/demoMode.md)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Whether the app is running in Demo Mode.
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

[[imageFile](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/imageFile.md)] [→ [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]
:   The image file that is to be uploaded.
    ::: features
    no setter
    :::

[[imageInBase64](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/imageInBase64.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Getter to access the base64 type.
    ::: features
    no setter
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.md)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[orgName](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/orgName.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   The organisation name.
    ::: features
    no setter
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

[[textHashTagController](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/textHashTagController.md)] [→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   The main text controller of the hashtag.
    ::: features
    no setter
    :::

[[titleController](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/titleController.md)] [→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   The text controller of the title body.
    ::: features
    no setter
    :::

[[userName](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/userName.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   The username of the currentUser.
    ::: features
    no setter
    :::

[[userPic](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/userPic.md)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   User profile picture.
    ::: features
    no setter
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.md)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[getImageFromGallery](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/getImageFromGallery.md)][({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.md)] camera = false]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to get the image from gallery.

[initialise](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/initialise.md) [→ void ]
:   This function is usedto do initialisation of stuff in the view
    model.

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

[removeImage](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/removeImage.md) [→ void ]
:   This function removes the image selected.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.md)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[setImageFile](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/setImageFile.md)][([[[File](https://api.flutter.dev/flutter/dart-io/File-class.md)?] file]) → void ]
:   Method to set image.

[[setImageInBase64](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/setImageInBase64.md)][([[[File](https://api.flutter.dev/flutter/dart-io/File-class.md)] file]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to set Image in Bsse64.

[[setState](../view_model_base_view_model/BaseModel/setState.md)][([[[ViewState](../enums_enums/ViewState.md)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[uploadPost](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/uploadPost.md)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function uploads the post finally, and navigate the success
    message or error message in Snack Bar.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.md)
2.  [add_post_view_model](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3.  AddPostViewModel class

##### add_post_view_model library







