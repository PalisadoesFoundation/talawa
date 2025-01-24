




toggleIsLiked method - LikeButtonViewModel class - like\_button\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/like\_button\_view\_model.dart](../../view_model_widgets_view_models_like_button_view_model/view_model_widgets_view_models_like_button_view_model-library.html)
3. [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. toggleIsLiked method

toggleIsLiked


dark\_mode

light\_mode




# toggleIsLiked method


void
toggleIsLiked()

function to toggleisLiked boolean.

**params**:
None

**returns**:
None


## Implementation

```
void toggleIsLiked() {
  if (!_isLiked) {
    _postService.addLike(_postID);
  }
}
```

 


1. [talawa](../../index.html)
2. [like\_button\_view\_model](../../view_model_widgets_view_models_like_button_view_model/view_model_widgets_view_models_like_button_view_model-library.html)
3. [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. toggleIsLiked method

##### LikeButtonViewModel class





talawa
1.0.0+1






