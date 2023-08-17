


# AddPostViewModel class









<p>AddPostViewModel class have different functions that are used.</p>
<p>to interact with the model to add a new post in the organization.</p>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- AddPostViewModel








## Constructors

[AddPostViewModel](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/AddPostViewModel.md) ()

   


## Properties

##### [controller](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/controller.md) &#8594; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



Post body text controller.  
_<span class="feature">read-only</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [imageFile](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/imageFile.md) &#8594; [File](https://api.flutter.dev/flutter/dart-io/File-class.html)?



The image file that is to be uploaded.  
_<span class="feature">read-only</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [orgName](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/orgName.md) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



The organisation name.  
_<span class="feature">read-only</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [titleController](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/titleController.md) &#8594; [TextEditingController](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)



Post title text controller.  
_<span class="feature">read-only</span>_



##### [userName](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/userName.md) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



The Username.  
_<span class="feature">read-only</span>_





## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">inherited</span>_



##### [getImageFromGallery](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/getImageFromGallery.md)({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) camera = false}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function is used to get the image from gallery.  




##### [initialise](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/initialise.md)() void



This function is usedto do initialisation of stuff in the view model.  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners.  
_<span class="feature">inherited</span>_



##### [removeImage](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/removeImage.md)() void



This function removes the image selected.  




##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes.  
_<span class="feature">inherited</span>_



##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_



##### [uploadPost](../view_model_after_auth_view_models_add_post_view_models_add_post_view_model/AddPostViewModel/uploadPost.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



This function uploads the post finally, and navigate the success message or error message in Snack Bar.  






## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















