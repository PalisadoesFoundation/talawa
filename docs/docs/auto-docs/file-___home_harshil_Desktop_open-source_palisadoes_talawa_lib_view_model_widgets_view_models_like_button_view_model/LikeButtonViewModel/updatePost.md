




updatePost method - LikeButtonViewModel class - like\_button\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/like\_button\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_like_button_view_model/)
3. [LikeButtonViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. updatePost method

updatePost


dark\_mode

light\_mode




# updatePost method


void
updatePost(

1. dynamic post

)

function to update the Post.

**params**:

* `post`: Post Object

**returns**:
None


## Implementation

```
void updatePost(Post post) {
  if (_postID == post.sId) {
    _likedBy = post.likedBy!;
    checkAndSetTheIsLiked();
  }
}
```

 


1. [talawa](../../index.html)
2. [like\_button\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_like_button_view_model/)
3. [LikeButtonViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. updatePost method

##### LikeButtonViewModel class





talawa
1.0.0+1






