


# initialize method








void initialize
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[LikedBy](../../models_post_post_model/LikedBy-class.md)> likedBy, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID)








## Implementation

```dart
void initialize(List<LikedBy> likedBy, String postID) {
  _postID = postID;
  _user = _userConfig.currentUser;
  _likedBy = likedBy;
  notifyListeners();
  checkAndSetTheIsLiked();
  _updatePostSubscription =
      _postService.updatedPostStream.listen((post) => updatePost(post));
}
```







