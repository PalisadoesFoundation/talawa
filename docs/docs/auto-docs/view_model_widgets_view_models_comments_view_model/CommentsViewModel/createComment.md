




createComment method - CommentsViewModel class - comments\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/comments\_view\_model.dart](../../view_model_widgets_view_models_comments_view_model/view_model_widgets_view_models_comments_view_model-library.html)
3. [CommentsViewModel](../../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. createComment method

createComment


dark\_mode

light\_mode




# createComment method


Future<void>
createComment(

1. String msg

)

This function add comment on the post. The function uses `createComments` method provided by Comment Service.

**params**:

* `msg`: The comment text.

**returns**:
None


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [comments\_view\_model](../../view_model_widgets_view_models_comments_view_model/view_model_widgets_view_models_comments_view_model-library.html)
3. [CommentsViewModel](../../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. createComment method

##### CommentsViewModel class





talawa
1.0.0+1






