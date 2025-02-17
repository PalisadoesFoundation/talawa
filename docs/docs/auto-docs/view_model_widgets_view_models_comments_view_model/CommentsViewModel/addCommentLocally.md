
<div>

# addCommentLocally method

</div>


void addCommentLocally(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    msg]

)



This function add comment locally.

**params**:

-   `msg`: BuildContext, contain parent info

**returns**: None



## Implementation

``` language-dart
void addCommentLocally(String msg) {
  _postService.addCommentLocally(_postID);
  final creator = _userConfig.currentUser;
  final Comment localComment = Comment(
    text: msg,
    createdAt: DateTime..,
    creator: creator,
  );
  _commentlist.add(localComment);
  ;
}
```







1.  [talawa](../../index.md)
2.  [comments_view_model](../../view_model_widgets_view_models_comments_view_model/)
3.  [CommentsViewModel](../../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.md)
4.  addCommentLocally method

##### CommentsViewModel class







