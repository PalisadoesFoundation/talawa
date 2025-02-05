


# addLike method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> addLike
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID)





<p>This function is used to add Like to the Post.</p>
<p>params:</p>
<ul>
<li><code>postId</code> : id of the post where like need to be added.</li>
</ul>



## Implementation

```dart
Future<void> addLike(String postID) async {
  _localAddLike(postID);
  final String mutation = PostQueries().addLike();
  // run the graphQl mutation.
  final result = await _dbFunctions
      .gqlAuthMutation(mutation, variables: {"postID": postID});
  print(result);
  // return result
  return result;
}
```







