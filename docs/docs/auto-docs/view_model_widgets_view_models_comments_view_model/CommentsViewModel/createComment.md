
<div>

# createComment method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
createComment(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    msg]

)



This function add comment on the post. The function uses
`createComments` method provided by Comment Service.

**params**:

-   `msg`: The comment text.

**returns**: None



## Implementation

``` language-dart
Future<void> createComment(String msg) async {
  await actionHandlerService.performAction(
    actionType: ActionType.optimistic,
    action: () async {
      await _commentService.createComments(_postID, msg);
      return null;
    },
    updateUI: () {
      addCommentLocally(msg);
    },
  );
}
```







1.  [talawa](../../index.md)
2.  [comments_view_model](../../view_model_widgets_view_models_comments_view_model/)
3.  [CommentsViewModel](../../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.md)
4.  createComment method

##### CommentsViewModel class







