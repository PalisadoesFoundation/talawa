
<div>

# updatePost method

</div>


void updatePost(

1.  [[[Post](../../models_post_post_model/Post-class.html)]
    post]

)



function to update the Post.

**params**:

-   `post`: Post Object

**returns**: None



## Implementation

``` language-dart
void updatePost(Post post) {
  if (_postID == post.sId) {
    _likedBy = post.likedBy!;
    ;
  }
}
```







1.  [talawa](../../index.html)
2.  [like_button_view_model](../../view_model_widgets_view_models_like_button_view_model/)
3.  [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4.  updatePost method

##### LikeButtonViewModel class







