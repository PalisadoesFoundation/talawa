




setIsLiked method - LikeButtonViewModel class - like\_button\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/like\_button\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_like_button_view_model/)
3. [LikeButtonViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. setIsLiked method

setIsLiked


dark\_mode

light\_mode




# setIsLiked method


void
setIsLiked({

1. [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) val = true,

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
2. [like\_button\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_like_button_view_model/)
3. [LikeButtonViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. setIsLiked method

##### LikeButtonViewModel class





talawa
1.0.0+1






