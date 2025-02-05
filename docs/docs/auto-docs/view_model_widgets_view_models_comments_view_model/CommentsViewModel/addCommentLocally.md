


# addCommentLocally method








void addCommentLocally
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) msg)








## Implementation

```dart
void addCommentLocally(String msg) {
  _postService.addCommentLocally(_postID);
  final creator = _userConfig.currentUser;
  final Comment localComment = Comment(
    text: msg,
    createdAt: DateTime.now().toString(),
    creator: creator,
  );
  _commentlist.insert(0, localComment);
  notifyListeners();
}
```







