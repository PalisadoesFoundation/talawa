


# checkAndSetTheIsLiked method








void checkAndSetTheIsLiked
()








## Implementation

```dart
void checkAndSetTheIsLiked() {
  setIsLiked(val: false);
  for (var i = 0; i < _likedBy.length; i++) {
    if (_likedBy[i].sId == _user.id) {
      setIsLiked();
    }
  }
}
```







