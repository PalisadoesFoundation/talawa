




createComments method - CommentService class - comment\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/comment\_service.dart](../../services_comment_service/services_comment_service-library.html)
3. [CommentService](../../services_comment_service/CommentService-class.html)
4. createComments method

createComments


dark\_mode

light\_mode




# createComments method


Future<void>
createComments(

1. String postId,
2. String text

)

This function is used to add comment on the post.

To verify things are working, check out the native platform logs.
**params**:

* `postId`: The post id on which comment is to be added.
* `text`: The comment text.

**returns**:
None


## Implementation

```
Future<void> createComments(String postId, String text) async {
  final String createCommentQuery = CommentQueries().createComment();

  try {
    await _dbFunctions.gqlAuthMutation(
      createCommentQuery,
      variables: {
        'postId': postId, //Add your variables here
        'text': text,
      },
    );

    _navigationService.showTalawaErrorSnackBar(
      "Comment sent",
      MessageType.info,
    );
  } on Exception catch (_) {
    _navigationService.showTalawaErrorSnackBar(
      "Something went wrong",
      MessageType.error,
    );
  }
}
```

 


1. [talawa](../../index.html)
2. [comment\_service](../../services_comment_service/services_comment_service-library.html)
3. [CommentService](../../services_comment_service/CommentService-class.html)
4. createComments method

##### CommentService class





talawa
1.0.0+1






