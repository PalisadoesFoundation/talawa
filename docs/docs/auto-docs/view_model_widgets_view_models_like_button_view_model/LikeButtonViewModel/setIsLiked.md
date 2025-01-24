




setIsLiked method - LikeButtonViewModel class - like\_button\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/like\_button\_view\_model.dart](../../view_model_widgets_view_models_like_button_view_model/view_model_widgets_view_models_like_button_view_model-library.html)
3. [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. setIsLiked method

setIsLiked


dark\_mode

light\_mode




# setIsLiked method


void
setIsLiked({

1. bool val = true,

})

function to set isLiked boolean.

**params**:

* `val`: value to set bool to.

**returns**:
None


## Implementation

```
void setIsLiked({bool val = true}) {
  _isLiked = val;
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [like\_button\_view\_model](../../view_model_widgets_view_models_like_button_view_model/view_model_widgets_view_models_like_button_view_model-library.html)
3. [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. setIsLiked method

##### LikeButtonViewModel class





talawa
1.0.0+1






