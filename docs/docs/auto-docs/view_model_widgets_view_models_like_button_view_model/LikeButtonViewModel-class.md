




LikeButtonViewModel class - like\_button\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/widgets\_view\_models/like\_button\_view\_model.dart](../view_model_widgets_view_models_like_button_view_model/view_model_widgets_view_models_like_button_view_model-library.html)
3. LikeButtonViewModel class

LikeButtonViewModel


dark\_mode

light\_mode




# LikeButtonViewModel class


LikeButtonViewModel class helps to serve the data and to react to user's input for Like Button Widget.

Methods include:

* `toggleIsLiked`
* `setIsLiked`
* `updatePost`

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* LikeButtonViewModel



## Constructors

[LikeButtonViewModel](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/LikeButtonViewModel.html)()




## Properties

[hashCode](https://api.flutter.dev/flutter/foundation/Listenable/hashCode.html)
→ int

The hash code for this object.
no setterinherited

[hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)
→ bool

Whether any listeners are currently registered.
no setterinherited

[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)
→ bool

no setterinherited

[isLiked](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/isLiked.html)
→ bool

Getters.
no setter

[likedBy](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/likedBy.html)
→ List<[LikedBy](../models_post_post_model/LikedBy-class.html)>

no setter

[likesCount](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/likesCount.html)
→ int

no setter

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited



## Methods

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[checkAndSetTheIsLiked](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/checkAndSetTheIsLiked.html)()
→ void


function to set isLiked boolean and check.

[dispose](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
override

[initialize](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/initialize.html)(List<[LikedBy](../models_post_post_model/LikedBy-class.html)> likedBy, String postID)
→ void


First function to initialize the ViewModel.

[noSuchMethod](https://api.flutter.dev/flutter/foundation/Listenable/noSuchMethod.html)(Invocation invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)()
→ void


Call all the registered listeners.
inherited

[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Remove a previously registered closure from the list of closures that are
notified when the object changes.
inherited

[setIsLiked](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/setIsLiked.html)({bool val = true})
→ void


function to set isLiked boolean.

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toggleIsLiked](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/toggleIsLiked.html)()
→ void


function to toggleisLiked boolean.

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited

[updatePost](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/updatePost.html)([Post](../models_post_post_model/Post-class.html) post)
→ void


function to update the Post.



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [like\_button\_view\_model](../view_model_widgets_view_models_like_button_view_model/view_model_widgets_view_models_like_button_view_model-library.html)
3. LikeButtonViewModel class

##### like\_button\_view\_model library





talawa
1.0.0+1






