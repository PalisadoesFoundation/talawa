::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [view_model/widgets_view_models/comments_view_model.dart](../view_model_widgets_view_models_comments_view_model/)
3.  CommentsViewModel class

::: self-name
CommentsViewModel
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_comments_view_model/view_model_widgets_view_models_comments_view_model-library-sidebar.html" below-sidebar="view_model_widgets_view_models_comments_view_model/CommentsViewModel-class-sidebar.html"}
<div>

# [CommentsViewModel]{.kind-class} class

</div>

::: {.section .desc .markdown}
CommentsViewModel class helps to serve the data from model and to react
to user\'s input for Comment Widget.

Methods include:

-   `getComments` : to get all comments on the post.
-   `createComment` : to add comment on the post.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
    -   [BaseModel](../view_model_base_view_model/BaseModel-class.html)
    -   CommentsViewModel
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[CommentsViewModel](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/CommentsViewModel.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[commentList](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/commentList.html)]{.name} [→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Comment](../models_comment_comment_model/Comment-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   comment list getter.
    ::: features
    [no setter]{.feature}
    :::

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

[[postId](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/postId.html)]{.name} [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   Id of current post.
    ::: features
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

[[addCommentLocally](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/addCommentLocally.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [msg]{.parameter-name}]{#addCommentLocally-param-msg .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   This function add comment locally.

[[addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)]{.name}[([[[VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html)]{.type-annotation} [listener]{.parameter-name}]{#addListener-param-listener .parameter}) [→ void]{.returntype .parameter} ]{.signature}
:   Register a closure to be called when the object changes.
    ::: features
    [inherited]{.feature}
    :::

[[createComment](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/createComment.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [msg]{.parameter-name}]{#createComment-param-msg .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function add comment on the post. The function uses
    `createComments` method provided by Comment Service.

[[dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Discards any resources used by the object. After this is called, the
    object is not in a usable state and should be discarded (calls to
    [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)
    will throw after the object is disposed).
    ::: features
    [inherited]{.feature}
    :::

[[getComments](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/getComments.html)]{.name}[() [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to get all comments on the post.

[[initialise](../view_model_widgets_view_models_comments_view_model/CommentsViewModel/initialise.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [postID]{.parameter-name}]{#initialise-param-postID .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to initialise the CommentViewModel.

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

[[setState](../view_model_base_view_model/BaseModel/setState.html)]{.name}[([[[ViewState](../enums_enums/ViewState.html)]{.type-annotation} [viewState]{.parameter-name}]{#setState-param-viewState .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
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
2.  [comments_view_model](../view_model_widgets_view_models_comments_view_model/)
3.  CommentsViewModel class

##### comments_view_model library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
