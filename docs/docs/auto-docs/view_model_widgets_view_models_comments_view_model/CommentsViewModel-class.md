
<div>

# CommentsViewModel class

</div>


CommentsViewModel class helps to serve the data from model and to react
to user\'s input for Comment Widget.

Methods include:

-   `getComments` : to get all comments on the post.
-   `createComment` : to add comment on the post.




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   CommentsViewModel



## Constructors

[CommentsViewModel](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/CommentsViewModel.html)

:   



## Properties

[[commentList](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/commentList.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Comment](../models_comment_comment_model/Comment-class.html)]\>]]
:   comment list getter.
    ::: features
    no setter
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

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]

:   ::: features
    no setterinherited
    :::

[[postId](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/postId.html)] [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
:   Id of current post.
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



## Methods

[[addCommentLocally](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/addCommentLocally.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] msg]) → void ]
:   This function add comment locally.

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[[createComment](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/createComment.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] msg]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function add comment on the post. The function uses
    `createComments` method provided by Comment Service.

[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    inherited
    :::

[[getComments](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/getComments.html)][() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to get all comments on the post.

[[initialise](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/initialise.html)][([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] postID]) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]] ]
:   This function is used to initialise the CommentViewModel.

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

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    inherited
    :::

[[setState](../view_model_base_view_model/BaseModel/setState.html)][([[[ViewState](../enums_enums/ViewState.html)] viewState]) → void ]

:   ::: features
    inherited
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [comments_view_model](../view_model_widgets_view_models_comments_view_model/)
3.  CommentsViewModel class

##### comments_view_model library







