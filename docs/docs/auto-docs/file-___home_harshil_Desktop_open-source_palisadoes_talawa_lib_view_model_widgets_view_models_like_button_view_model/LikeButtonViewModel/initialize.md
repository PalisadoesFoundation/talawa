




initialize method - LikeButtonViewModel class - like\_button\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/like\_button\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_like_button_view_model/)
3. [LikeButtonViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


void
initialize(

1. [List](https://api.flutter.dev/flutter/dart-core/List-class.html) likedBy,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) postID

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
2. [like\_button\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_like_button_view_model/)
3. [LikeButtonViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4. initialize method

##### LikeButtonViewModel class





talawa
1.0.0+1






