




getCommentsForPost method - CommentService class - comment\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/comment\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_comment_service/)
3. [CommentService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_comment_service/CommentService-class.html)
4. getCommentsForPost method

getCommentsForPost


dark\_mode

light\_mode




# getCommentsForPost method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<[List](https://api.flutter.dev/flutter/dart-core/List-class.html)>
getCommentsForPost(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) postId

)

This function is used to get all comments on the post.

To verify things are working, check out the native platform logs.
**params**:

* `postId`: The post id for which comments are to be fetched.

**returns**:

* `Future<List<dynamic>>`: promise that will be fulfilled with list of comments.

## Implementation

```
Future<List<dynamic>> getCommentsForPost(String postId) async {
  final String getCommmentQuery = CommentQueries().getPostsComments(postId);

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

 


1. [talawa](../../index.html)
2. [comment\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_comment_service/)
3. [CommentService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_comment_service/CommentService-class.html)
4. getCommentsForPost method

##### CommentService class





talawa
1.0.0+1






