




initialise method - CommentsViewModel class - comments\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/comments\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/)
3. [CommentsViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
initialise(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID

)

This function is used to initialise the CommentViewModel.

To verify things are working, check out the native platform logs.
**params**:

* `postID`: The post id for which comments are to be fetched.

**returns**:
None


## Implementation

```
Future<void> initialise(String postID) async {
  _commentlist = [];
  _postID = postID;
  _commentService = locator<CommentService>();
  _userConfig = locator<UserConfig>();
  _postService = locator<PostService>();
  notifyListeners();
  await getComments();
}
```

 


1. [talawa](../../index.html)
2. [comments\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/)
3. [CommentsViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. initialise method

##### CommentsViewModel class





talawa
1.0.0+1






