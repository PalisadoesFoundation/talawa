


# createComments method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> createComments
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postId, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) text)





<p>This function is used to add comment on the post.</p>
<p>parameters:</p>
<ul>
<li>```dartpostId``` - Post id where comment need to be added.</li>
<li>```darttext``` - content of the comment.</li>
</ul>



## Implementation

```dart
Future<void> createComments(String postId, String text) async \{
  print("comment service called");
  final String createCommentQuery = CommentQueries().createComment();
  final result = await _dbFunctions.gqlAuthMutation(
    createCommentQuery,
    variables: \{
      'postId': postId, //Add your variables here
      'text': text
    \},
  );
  print("comment added");
  print(result);
  return result;
\}
```







