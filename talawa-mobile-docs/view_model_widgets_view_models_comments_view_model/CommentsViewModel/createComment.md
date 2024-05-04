


# createComment method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) createComment
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) msg)





<p>This function add comment on the post.
The function uses <code>createComments</code> method provided by Comment Service.</p>
<p>params:</p>
<ul>
<li><code>msg</code> : text of the comment to add.</li>
</ul>



## Implementation

```dart
Future createComment(String msg) async {
  print("comment viewModel called");
  await _commentService.createComments(_postID, msg);
  addCommentLocally(msg);
}
```







