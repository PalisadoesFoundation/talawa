
<div>

# getComments method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




This function is used to get all comments on the post.

To verify things are working, check out the native platform logs.
**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  setState(ViewState.busy);
  final List commentsJSON = await _commentService.getCommentsForPost(_postID);
  print(commentsJSON);
  commentsJSON.forEach((commentJson) {
    _commentlist.add(Comment.fromJson(commentJson as Map<String, dynamic>));
  });
  setState(ViewState.idle);
}
```







1.  [talawa](../../index.md)
2.  [comments_view_model](../../view_model_widgets_view_models_comments_view_model/)
3.  [CommentsViewModel](../../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.md)
4.  getComments method

##### CommentsViewModel class







