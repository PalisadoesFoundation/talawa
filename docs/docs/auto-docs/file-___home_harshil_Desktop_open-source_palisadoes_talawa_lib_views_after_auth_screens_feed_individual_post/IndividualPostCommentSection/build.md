




build method - IndividualPostCommentSection class - individual\_post library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/feed/individual\_post.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/)
3. [IndividualPostCommentSection](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/IndividualPostCommentSection-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
@override
Widget build(BuildContext context) {
  return BaseView<CommentsViewModel>(
    onModelReady: (model) async {
      await model.initialise(postID);
      // print(model.commentList.first.creator);
      _commentViewModel = model;
    },
    builder: (context, model, child) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildPadding(context, "Comments"),
        // Looping through the commentList list,
        for (int i = 0; i < model.commentList.length; i++)
          // renders the custom widget for invidual user.
          CommentTemplate(comment: model.commentList[i]),
      ],
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [individual\_post](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/)
3. [IndividualPostCommentSection](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/IndividualPostCommentSection-class.html)
4. build method

##### IndividualPostCommentSection class





talawa
1.0.0+1






