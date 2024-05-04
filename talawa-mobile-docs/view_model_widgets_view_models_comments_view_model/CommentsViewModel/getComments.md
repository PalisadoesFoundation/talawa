


# getComments method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) getComments
()





<p>This methods fetch all comments on the post.
The function uses <code>getCommentsForPost</code> method by Comment Service.</p>



## Implementation

```dart
Future getComments() async {
  setState(ViewState.busy);
  final List commentsJSON =
      await _commentService.getCommentsForPost(_postID) as List;
  print(commentsJSON);
  commentsJSON.forEach((commentJson) {
    _commentlist.add(Comment.fromJson(commentJson as Map<String, dynamic>));
  });
  setState(ViewState.idle);
}
```







