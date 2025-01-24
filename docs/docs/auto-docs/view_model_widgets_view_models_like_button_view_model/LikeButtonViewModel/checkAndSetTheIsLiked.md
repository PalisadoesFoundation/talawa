




checkAndSetTheIsLiked method - LikeButtonViewModel class - like\_button\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/like\_button\_view\_model.dart](../../view_model_widgets_view_models_like_button_view_model/view_model_widgets_view_models_like_button_view_model-library.html)
3. [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. checkAndSetTheIsLiked method

checkAndSetTheIsLiked


dark\_mode

light\_mode




# checkAndSetTheIsLiked method


void
checkAndSetTheIsLiked()

function to set isLiked boolean and check.

**params**:
None

**returns**:
None


## Implementation

```
void checkAndSetTheIsLiked() {
  setIsLiked(val: false);
  for (var i = 0; i < _likedBy.length; i++) {
    if (_likedBy[i].sId == _user.id) {
      setIsLiked();
    }
  }
}
```

 


1. [talawa](../../index.html)
2. [like\_button\_view\_model](../../view_model_widgets_view_models_like_button_view_model/view_model_widgets_view_models_like_button_view_model-library.html)
3. [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. checkAndSetTheIsLiked method

##### LikeButtonViewModel class





talawa
1.0.0+1






