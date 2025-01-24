




initialise method - CommentsViewModel class - comments\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/comments\_view\_model.dart](../../view_model_widgets_view_models_comments_view_model/view_model_widgets_view_models_comments_view_model-library.html)
3. [CommentsViewModel](../../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


Future<void>
initialise(

1. String postID

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
2. [comments\_view\_model](../../view_model_widgets_view_models_comments_view_model/view_model_widgets_view_models_comments_view_model-library.html)
3. [CommentsViewModel](../../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. initialise method

##### CommentsViewModel class





talawa
1.0.0+1






