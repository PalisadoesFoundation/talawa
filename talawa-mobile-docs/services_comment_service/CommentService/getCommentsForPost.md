


# getCommentsForPost method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) getCommentsForPost
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postId)





<p>This function is used to fetch all comments on the post.</p>
<p>parameters:</p>
<ul>
<li><code>postId</code> - Post id for which comments need to be fetched.</li>
</ul>



## Implementation

```dart
Future getCommentsForPost(String postId) async {
  final String getCommmentQuery = CommentQueries().getPostsComments(postId);
  final result = await _dbFunctions.gqlAuthMutation(getCommmentQuery);
  if (result.data != null) {
    return result.data["commentsByPost"] as List;
  }
  return [];
}
```







