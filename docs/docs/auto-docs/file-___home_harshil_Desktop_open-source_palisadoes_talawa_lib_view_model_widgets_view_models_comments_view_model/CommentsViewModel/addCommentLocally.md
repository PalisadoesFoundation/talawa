




addCommentLocally method - CommentsViewModel class - comments\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/comments\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/)
3. [CommentsViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. addCommentLocally method

addCommentLocally


dark\_mode

light\_mode




# addCommentLocally method


void
addCommentLocally(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) msg

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
2. [comments\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/)
3. [CommentsViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. addCommentLocally method

##### CommentsViewModel class





talawa
1.0.0+1






