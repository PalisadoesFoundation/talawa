
<div>

# getCommentsForPost method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)]\>]]
getCommentsForPost(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    postId]

)



This function is used to get all comments on the post.

To verify things are working, check out the native platform logs.
**params**:

-   `postId`: The post id for which comments are to be fetched.

**returns**:

-   `Future<List<dynamic>>`: promise that will be fulfilled with list of
    comments.



## Implementation

``` language-dart
Future<List<dynamic>> getCommentsForPost(String postId) async {
  final String getCommmentQuery = .getPostsComments(postId);

  final QueryResult<Object?> result =
      await _dbFunctions.gqlAuthMutation(getCommmentQuery);

  if (result.data == null) {
    return [];
  }
  final resultData = result.data;

  final resultDataPostComments = (resultData?['post']
      as Map<String, dynamic>)['comments'] as List<dynamic>;
  return resultDataPostComments;
}
```







1.  [talawa](../../index.html)
2.  [comment_service](../../services_comment_service/)
3.  [CommentService](../../services_comment_service/CommentService-class.html)
4.  getCommentsForPost method

##### CommentService class







