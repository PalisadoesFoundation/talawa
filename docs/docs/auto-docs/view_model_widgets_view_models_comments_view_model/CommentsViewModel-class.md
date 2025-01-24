




CommentsViewModel class - comments\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/widgets\_view\_models/comments\_view\_model.dart](../view_model_widgets_view_models_comments_view_model/view_model_widgets_view_models_comments_view_model-library.html)
3. CommentsViewModel class

CommentsViewModel


dark\_mode

light\_mode




# CommentsViewModel class


CommentsViewModel class helps to serve the data from model and to react to user's input for Comment Widget.

Methods include:

* `getComments` : to get all comments on the post.
* `createComment` : to add comment on the post.

Inheritance

* Object
* [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
* [BaseModel](../view_model_base_view_model/BaseModel-class.html)
* CommentsViewModel



## Constructors

[CommentsViewModel](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/CommentsViewModel.html)()




## Properties

[commentList](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/commentList.html)
→ List<[Comment](../models_comment_comment_model/Comment-class.html)>

comment list getter.
no setter

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

[postId](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/postId.html)
→ String

Id of current post.
no setter

[runtimeType](https://api.flutter.dev/flutter/foundation/Listenable/runtimeType.html)
→ Type

A representation of the runtime type of the object.
no setterinherited

[state](../view_model_base_view_model/BaseModel/state.html)
→ [ViewState](../enums_enums/ViewState.html)

no setterinherited



## Methods

[addCommentLocally](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/addCommentLocally.html)(String msg)
→ void


This function add comment locally.

[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)
→ void


Register a closure to be called when the object changes.
inherited

[createComment](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/createComment.html)(String msg)
→ Future<void>


This function add comment on the post. The function uses `createComments` method provided by Comment Service.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)()
→ void


Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) will throw after the object is disposed).
inherited

[getComments](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/getComments.html)()
→ Future<void>


This function is used to get all comments on the post.

[initialise](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/initialise.html)(String postID)
→ Future<void>


This function is used to initialise the CommentViewModel.

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

[setState](../view_model_base_view_model/BaseModel/setState.html)([ViewState](../enums_enums/ViewState.html) viewState)
→ void


inherited

[toString](https://api.flutter.dev/flutter/foundation/Listenable/toString.html)()
→ String


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/foundation/Listenable/operator_equals.html)(Object other)
→ bool


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [comments\_view\_model](../view_model_widgets_view_models_comments_view_model/view_model_widgets_view_models_comments_view_model-library.html)
3. CommentsViewModel class

##### comments\_view\_model library





talawa
1.0.0+1






