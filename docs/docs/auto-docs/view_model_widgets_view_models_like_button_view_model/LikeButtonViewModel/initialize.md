




initialize method - LikeButtonViewModel class - like\_button\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/like\_button\_view\_model.dart](../../view_model_widgets_view_models_like_button_view_model/view_model_widgets_view_models_like_button_view_model-library.html)
3. [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


void
initialize(

1. List<[LikedBy](../../models_post_post_model/LikedBy-class.html)> likedBy,
2. String postID

)

First function to initialize the ViewModel.

**params**:

* `likedBy`: List of LikedBy Objects
* `postID`: Post Id of the Post

**returns**:
None


## Implementation

```
void initialize(List<LikedBy> likedBy, String postID) {
  _postID = postID;
  _user = _userConfig.currentUser;
  _likedBy = likedBy;
  notifyListeners();
  checkAndSetTheIsLiked();
  _updatePostSubscription =
      _postService.updatedPostStream.listen((post) => updatePost(post));
}
```

 


1. [talawa](../../index.html)
2. [like\_button\_view\_model](../../view_model_widgets_view_models_like_button_view_model/view_model_widgets_view_models_like_button_view_model-library.html)
3. [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. initialize method

##### LikeButtonViewModel class





talawa
1.0.0+1






