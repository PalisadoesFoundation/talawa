
<div>

# AddPostViewModel class

</div>


AddPostViewModel class have different functions.

They are used to interact with the model to add a new post in the
organization.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   AddPostViewModel



## Constructors

[[AddPostViewModel](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/AddPostViewModel.html)][({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] demoMode = false]})]

:   



## Properties

[[controller](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/controller.html)] [→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   The main text controller of the post body.
    ::: features
    no setter
    :::

[[demoMode](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/demoMode.html)] [↔ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
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

[[imageFile](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/imageFile.html)] [→ [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?]
:   The image file that is to be uploaded.
    ::: features
    no setter
    :::

[[imageInBase64](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/imageInBase64.html)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   Getter to access the base64 type.
    ::: features
    no setter
    :::

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[orgName](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/orgName.html)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   The organisation name.
    ::: features
    no setter
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

[[textHashTagController](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/textHashTagController.html)] [→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   The main text controller of the hashtag.
    ::: features
    no setter
    :::

[[titleController](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/titleController.html)] [→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)]
:   The text controller of the title body.
    ::: features
    no setter
    :::

[[userName](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/userName.html)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   The username of the currentUser.
    ::: features
    no setter
    :::

[[userPic](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/userPic.html)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]
:   User profile picture.
    ::: features
    no setter
    :::



## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[getImageFromGallery](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/getImageFromGallery.html)][({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] camera = false]}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to get the image from gallery.

[initialise](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/initialise.html) [→ void ]
:   This function is usedto do initialisation of stuff in the view
    model.

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

[removeImage](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/removeImage.html) [→ void ]
:   This function removes the image selected.

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[setImageFile](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/setImageFile.html)][([[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)?] file]) → void ]
:   Method to set image.

[[setImageInBase64](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/setImageInBase64.html)][([[[File](https://api.flutter.dev/flutter/dart-io/File-class.html)] file]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   Method to set Image in Bsse64.

[[setState](../view_model_base_view_model/BaseModel/setState.html)][([[[ViewState](../enums_enums/ViewState.html)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[uploadPost](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/uploadPost.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function uploads the post finally, and navigate the success
    message or error message in Snack Bar.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [add_post_view_model](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/)
3.  AddPostViewModel class

##### add_post_view_model library







