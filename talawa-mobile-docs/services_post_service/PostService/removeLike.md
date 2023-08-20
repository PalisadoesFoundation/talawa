


# removeLike method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> removeLike
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID)





<p>This function is used to remove like from the Post.</p>
<p>params:</p>
<ul>
<li><code>postId</code> : id of the post where like need to be removed.</li>
</ul>



## Implementation

```dart
Future<void> removeLike(String postID) async {
  _removeLocal(postID);
  final String mutation = PostQueries().removeLike();
  final result = await _dbFunctions
      .gqlAuthMutation(mutation, variables: {"postID": postID});
  print(result);
  return result;
}
```







