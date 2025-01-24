




AddPostViewModel class - add\_post\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/after\_auth\_view\_models/add\_post\_view\_models/add\_post\_view\_model.dart](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/view_model_after_auth_view_models_add_post_view_models_add_post_view_model-library.html)
3. AddPostViewModel class

AddPostViewModel


dark\_mode

light\_mode




# AddPostViewModel class


AddPostViewModel class have different functions.

They are used to interact with the model to add a new post in the
organization.


Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* AddPostViewModel



## Constructors

[AddPostViewModel](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/AddPostViewModel.html)({bool demoMode = false})




## Properties

[controller](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/controller.html)
→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

The main text controller of the post body.
no setter

[demoMode](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/demoMode.html)
↔ bool

Whether the app is running in Demo Mode.
getter/setter pair

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[imageFile](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/imageFile.html)
→ File?

The image file that is to be uploaded.
no setter

[imageInBase64](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/imageInBase64.html)
→ String?

Getter to access the base64 type.
no setter

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[orgName](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/orgName.html)
→ String

The organisation name.
no setter

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited

[textHashTagController](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/textHashTagController.html)
→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

The main text controller of the hashtag.
no setter

[titleController](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/titleController.html)
→ [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

The text controller of the title body.
no setter

[userName](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/userName.html)
→ String

The username of the currentUser.
no setter

[userPic](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/userPic.html)
→ String?

User profile picture.
no setter



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[getImageFromGallery](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/getImageFromGallery.html)({bool camera = false})
→ Future<void>


This function is used to get the image from gallery.

[initialise](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/initialise.html)()
→ void


This function is usedto do initialisation of stuff in the view model.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[removeImage](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/removeImage.html)()
→ void


This function removes the image selected.

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[setImageFile](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/setImageFile.html)(File? file)
→ void


Method to set image.

[setImageInBase64](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/setImageInBase64.html)(File file)
→ Future<void>


Method to set Image in Bsse64.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited

[uploadPost](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/uploadPost.html)()
→ Future<void>


This function uploads the post finally, and navigate the success message or error message in Snack Bar.



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [add\_post\_view\_model](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/view_model_after_auth_view_models_add_post_view_models_add_post_view_model-library.html)
3. AddPostViewModel class

##### add\_post\_view\_model library





talawa
1.0.0+1






