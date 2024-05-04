


# setIsLiked method








void setIsLiked
({[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) val = true})





<p>This function set <code>_isLike</code> to true.</p>



## Implementation

```dart
void setIsLiked({bool val = true}) {
  _isLiked = val;
  notifyListeners();
}
```







