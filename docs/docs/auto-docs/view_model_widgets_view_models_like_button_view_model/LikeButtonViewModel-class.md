
<div>

# LikeButtonViewModel class

</div>


LikeButtonViewModel class helps to serve the data and to react to
user\'s input for Like Button Widget.

Methods include:

-   `toggleIsLiked`
-   `setIsLiked`
-   `updatePost`




Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   LikeButtonViewModel



## Constructors

[LikeButtonViewModel](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/LikeButtonViewModel.html)

:   



## Properties

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

[[isLiked](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/isLiked.html)] [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
:   Getters.
    ::: features
    no setter
    :::

[[likedBy](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/likedBy.html)] [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[LikedBy](../models_post_post_model/LikedBy-class.html)]\>]]

:   ::: features
    no setter
    :::

[[likesCount](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/likesCount.html)] [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]

:   ::: features
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

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)][([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)] listener]) → void ]
:   Register a closure to be called when the object changes.
    ::: features
    inherited
    :::

[checkAndSetTheIsLiked](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/checkAndSetTheIsLiked.html) [→ void ]
:   function to set isLiked boolean and check.

[dispose](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/dispose.html) [→ void ]
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    override
    :::

[[initialize](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/initialize.html)][([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[LikedBy](../models_post_post_model/LikedBy-class.html)]\>]] likedBy, ][[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)] postID]) → void ]
:   First function to initialize the ViewModel.

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

[[setIsLiked](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/setIsLiked.html)][({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] val = true]}) → void ]
:   function to set isLiked boolean.

[[setState](../view_model_base_view_model/BaseModel/setState.html)][([[[ViewState](../enums_enums/ViewState.html)] viewState]) → void ]

:   ::: features
    inherited
    :::

[toggleIsLiked](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/toggleIsLiked.html) [→ void ]
:   function to toggleisLiked boolean.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)][() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)] ]
:   A string representation of this object.
    ::: features
    inherited
    :::

[[updatePost](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/updatePost.html)][([[[Post](../models_post_post_model/Post-class.html)] post]) → void ]
:   function to update the Post.



## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)][([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)] other]) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)] ]
:   The equality operator.
    ::: features
    inherited
    :::







1.  [talawa](../index.html)
2.  [like_button_view_model](../view_model_widgets_view_models_like_button_view_model/)
3.  LikeButtonViewModel class

##### like_button_view_model library







