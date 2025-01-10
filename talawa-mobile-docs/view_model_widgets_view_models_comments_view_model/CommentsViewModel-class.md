


# CommentsViewModel class









<p>CommentsViewModel class helps to serve the data from model
and to react to user's input for Comment Widget.</p>
<p>Methods include:</p>
<ul>
<li><code>getComments</code> : to get all comments on the post.</li>
<li><code>createComment</code> : to add comment on the post.</li>
</ul>



**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [BaseModel](../view_model_base_view_model/BaseModel-class.md)
- CommentsViewModel








## Constructors

[CommentsViewModel](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/CommentsViewModel.md) ()

   


## Properties

##### [commentList](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/commentList.md) &#8594; [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Comment](../models_comment_comment_model/Comment-class.md)>



  
_<span class="feature">read-only</span>_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [isBusy](../view_model_base_view_model/BaseModel/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [postId](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/postId.md) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



  
_<span class="feature">read-only</span>_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.  
_<span class="feature">read-only</span><span class="feature">inherited</span>_



##### [state](../view_model_base_view_model/BaseModel/state.md) &#8594; [ViewState](../enums_enums/ViewState.md)



  
_<span class="feature">read-only</span><span class="feature">inherited</span>_





## Methods

##### [addCommentLocally](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/addCommentLocally.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) msg) void



  




##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes.  
_<span class="feature">inherited</span>_



##### [createComment](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/createComment.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) msg) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This function add comment on the post.
The function uses <code>createComments</code> method provided by Comment Service.  




##### [dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> will throw after the object is disposed).  
_<span class="feature">inherited</span>_



##### [getComments](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/getComments.md)() [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



This methods fetch all comments on the post.
The function uses <code>getCommentsForPost</code> method by Comment Service.  




##### [initialise](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/initialise.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)



  




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed.  
_<span class="feature">inherited</span>_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners.  
_<span class="feature">inherited</span>_



##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes.  
_<span class="feature">inherited</span>_



##### [setState](../view_model_base_view_model/BaseModel/setState.md)([ViewState](../enums_enums/ViewState.md) viewState) void



  
_<span class="feature">inherited</span>_



##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object.  
_<span class="feature">inherited</span>_





## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator.  
_<span class="feature">inherited</span>_















