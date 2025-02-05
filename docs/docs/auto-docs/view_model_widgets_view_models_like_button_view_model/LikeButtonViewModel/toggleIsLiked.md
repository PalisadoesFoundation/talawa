


# toggleIsLiked method








void toggleIsLiked
()





<p>This function add like to the post if not liked and
remove the like from the post if liked.</p>



## Implementation

```dart
void toggleIsLiked() {
  if (!_isLiked) {
    _postService.addLike(_postID);
  } else {
    _postService.removeLike(_postID);
  }
}
```







