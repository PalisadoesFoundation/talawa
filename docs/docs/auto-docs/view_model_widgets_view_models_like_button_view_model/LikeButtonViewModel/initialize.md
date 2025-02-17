
<div>

# initialize method

</div>


void initialize(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[LikedBy](../../models_post_post_model/LikedBy-class.md)]\>]]
    likedBy, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    postID]

)



First function to initialize the ViewModel.

**params**:

-   `likedBy`: List of LikedBy Objects
-   `postID`: Post Id of the Post

**returns**: None



## Implementation

``` language-dart
void initialize(List<LikedBy> likedBy, String postID) {
  _postID = postID;
  _user = _userConfig.currentUser;
  _likedBy = likedBy;
  ;
  ;
  _updatePostSubscription =
      _postService.updatedPostStream.listen((post) => updatePost(post));
}
```







1.  [talawa](../../index.md)
2.  [like_button_view_model](../../view_model_widgets_view_models_like_button_view_model/)
3.  [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.md)
4.  initialize method

##### LikeButtonViewModel class







