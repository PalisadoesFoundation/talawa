::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [view_model/widgets_view_models/like_button_view_model.dart](../view_model_widgets_view_models_like_button_view_model/)
3.  LikeButtonViewModel class

::: self-name
LikeButtonViewModel
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_like_button_view_model/view_model_widgets_view_models_like_button_view_model-library-sidebar.html" below-sidebar="view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class-sidebar.html"}
<div>

# [LikeButtonViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
LikeButtonViewModel class helps to serve the data and to react to
user\'s input for Like Button Widget.

Methods include:

-   `toggleIsLiked`
-   `setIsLiked`
-   `updatePost`
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   LikeButtonViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[LikeButtonViewModel](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/LikeButtonViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

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

[[isBusy](../view_model_base_view_model/BaseModel/isBusy.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}

:   ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[isLiked](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/isLiked.html)]{.name} [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.signature}
:   Getters.
    ::: features
    [no setter]{.feature}
    :::

[[likedBy](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/likedBy.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[LikedBy](../models_post_post_model/LikedBy-class.html)]{.type-parameter}\>]{.signature}]{.signature}

:   ::: features
    [no setter]{.feature}
    :::

[[likesCount](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/likesCount.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}

:   ::: features
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
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[checkAndSetTheIsLiked](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/checkAndSetTheIsLiked.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   function to set isLiked boolean and check.

[[dispose](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [override]{.feature}
    :::

[[initialize](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/initialize.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[LikedBy](../models_post_post_model/LikedBy-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [likedBy]{.parameter-name}, ]{#initialize-param-likedBy .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [postID]{.parameter-name}]{#initialize-param-postID .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   First function to initialize the ViewModel.

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

[[removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#removeListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Remove a previously registered closure from the list of closures
    that are notified when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[setIsLiked](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/setIsLiked.html)]{.name}[({[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [val]{.parameter-name} = [true]{.default-value}]{#setIsLiked-param-val .parameter}}) [→ void]{.returntype .parameter} ]{.signature}
:   function to set isLiked boolean.

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[toggleIsLiked](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/toggleIsLiked.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   function to toggleisLiked boolean.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[updatePost](../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel/updatePost.html)]{.name}[([[[Post](../models_post_post_model/Post-class.html)]{.type-annotation} [post]{.parameter-name}]{#updatePost-param-post .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   function to update the Post.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [like_button_view_model](../view_model_widgets_view_models_like_button_view_model/)
3.  LikeButtonViewModel class

##### like_button_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
