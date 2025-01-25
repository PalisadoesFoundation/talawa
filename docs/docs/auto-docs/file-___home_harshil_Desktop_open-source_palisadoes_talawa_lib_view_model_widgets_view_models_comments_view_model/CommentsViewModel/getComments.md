




getComments method - CommentsViewModel class - comments\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/comments\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/)
3. [CommentsViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. getComments method

getComments


dark\_mode

light\_mode




# getComments method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
getComments()

This function is used to get all comments on the post.

To verify things are working, check out the native platform logs.
**params**:
None

**returns**:
None


## Implementation

```
Future<void> getComments() async {
  setState(ViewState.busy);
  final List commentsJSON = await _commentService.getCommentsForPost(_postID);
  print(commentsJSON);
  commentsJSON.forEach((commentJson) {
    _commentlist.add(Comment.fromJson(commentJson as Map<String, dynamic>));
  });
  setState(ViewState.idle);
}
```

 


1. [talawa](../../index.html)
2. [comments\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/)
3. [CommentsViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. getComments method

##### CommentsViewModel class





talawa
1.0.0+1






