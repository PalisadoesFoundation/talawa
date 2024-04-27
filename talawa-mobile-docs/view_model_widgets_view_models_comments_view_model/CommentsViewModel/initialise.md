


# initialise method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) initialise
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID)








## Implementation

```dart
Future initialise(String postID) async {
  _commentlist = [];
  _postID = postID;
  _commentService = locator<CommentService>();
  _userConfig = locator<UserConfig>();
  _postService = locator<PostService>();
  notifyListeners();
  await getComments();
}
```







