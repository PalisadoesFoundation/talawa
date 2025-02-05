


# addCommentLocally method








void addCommentLocally
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID)








## Implementation

```dart
void addCommentLocally(String postID) {
  for (int i = 0; i < _posts.length; i++) {
    if (_posts[i].sId == postID) {
      _posts[i].comments!.add(Comments(sId: postID));
      _updatedPostStreamController.add(_posts[i]);
    }
  }
}
```







