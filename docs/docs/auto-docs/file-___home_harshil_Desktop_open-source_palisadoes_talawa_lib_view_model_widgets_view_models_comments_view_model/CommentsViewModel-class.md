




CommentsViewModel class - comments\_view\_model library - Dart API







menu

1. [talawa](../index.html)
2. [view\_model/widgets\_view\_models/comments\_view\_model.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/)
3. CommentsViewModel class

CommentsViewModel


dark\_mode

light\_mode




# CommentsViewModel class


CommentsViewModel class helps to serve the data from model and to react to user's input for Comment Widget.

Methods include:

* `getComments` : to get all comments on the post.
* `createComment` : to add comment on the post.

## Constructors

[CommentsViewModel](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel/CommentsViewModel.html)()




## Properties

[commentList](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel/commentList.html)
→ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)

comment list getter.
no setter

[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)
→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)

The hash code for this object.
no setterinherited

[postId](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel/postId.html)
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)

Id of current post.
no setter

[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)

A representation of the runtime type of the object.
no setterinherited



## Methods

[addCommentLocally](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel/addCommentLocally.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) msg)
→ void


This function add comment locally.

[createComment](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel/createComment.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) msg)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function add comment on the post. The function uses `createComments` method provided by Comment Service.

[getComments](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel/getComments.html)()
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function is used to get all comments on the post.

[initialise](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel/initialise.html)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID)
→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>


This function is used to initialise the CommentViewModel.

[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation)
→ dynamic


Invoked when a nonexistent method or property is accessed.
inherited

[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)()
→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)


A string representation of this object.
inherited



## Operators

[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)
→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)


The equality operator.
inherited



 


1. [talawa](../index.html)
2. [comments\_view\_model](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/)
3. CommentsViewModel class

##### comments\_view\_model library





talawa
1.0.0+1






