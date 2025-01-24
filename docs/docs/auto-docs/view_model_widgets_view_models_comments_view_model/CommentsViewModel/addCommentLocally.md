




addCommentLocally method - CommentsViewModel class - comments\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/comments\_view\_model.dart](../../view_model_widgets_view_models_comments_view_model/view_model_widgets_view_models_comments_view_model-library.html)
3. [CommentsViewModel](../../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. addCommentLocally method

addCommentLocally


dark\_mode

light\_mode




# addCommentLocally method


void
addCommentLocally(

1. String msg

)

This function add comment locally.

**params**:

* `msg`: BuildContext, contain parent info

**returns**:
None


## Implementation

```
void addCommentLocally(String msg) {
  _postService.addCommentLocally(_postID);
  final creator = _userConfig.currentUser;
  final Comment localComment = Comment(
    text: msg,
    createdAt: DateTime.now().toString(),
    creator: creator,
  );
  _commentlist.add(localComment);
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [comments\_view\_model](../../view_model_widgets_view_models_comments_view_model/view_model_widgets_view_models_comments_view_model-library.html)
3. [CommentsViewModel](../../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. addCommentLocally method

##### CommentsViewModel class





talawa
1.0.0+1






