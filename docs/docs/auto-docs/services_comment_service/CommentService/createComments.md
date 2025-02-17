
<div>

# createComments method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
createComments(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    postId, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    text]

)



This function is used to add comment on the post.

To verify things are working, check out the native platform logs.
**params**:

-   `postId`: The post id on which comment is to be added.
-   `text`: The comment text.

**returns**: None



## Implementation

``` language-dart
Future<void> createComments(String postId, String text) async {
  final String createCommentQuery = .;

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







1.  [talawa](../../index.md)
2.  [comment_service](../../services_comment_service/)
3.  [CommentService](../../services_comment_service/CommentService-class.md)
4.  createComments method

##### CommentService class







