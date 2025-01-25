




createComment method - CommentsViewModel class - comments\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/comments\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/)
3. [CommentsViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. createComment method

createComment


dark\_mode

light\_mode




# createComment method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
createComment(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) msg

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
2. [comments\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/)
3. [CommentsViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4. createComment method

##### CommentsViewModel class





talawa
1.0.0+1






