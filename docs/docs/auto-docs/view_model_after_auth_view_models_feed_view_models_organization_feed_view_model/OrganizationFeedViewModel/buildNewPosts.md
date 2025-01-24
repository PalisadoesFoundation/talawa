




buildNewPosts method - OrganizationFeedViewModel class - organization\_feed\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/feed\_view\_models/organization\_feed\_view\_model.dart](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/view_model_after_auth_view_models_feed_view_models_organization_feed_view_model-library.html)
3. [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. buildNewPosts method

buildNewPosts


dark\_mode

light\_mode




# buildNewPosts method


void
buildNewPosts(

1. List<[Post](../../models_post_post_model/Post-class.html)> newPosts

)

This function initialise `_posts` with `newPosts`.

more\_info\_if\_required

**params**:

* `newPosts`: new post

**returns**:
None


## Implementation

```
void buildNewPosts(List<Post> newPosts) {
  _posts = newPosts;
  final currentUserId = _userConfig.currentUser.id!;
  _userPosts.clear();
  for (final post in newPosts) {
    if (!_userPosts.any((element) => element.sId == post.sId) &&
        post.creator!.id == currentUserId) {
      _userPosts.insert(0, post);
    }
  }
  _isFetchingPosts = false;
  notifyListeners();
}
```

 


1. [talawa](../../index.html)
2. [organization\_feed\_view\_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/view_model_after_auth_view_models_feed_view_models_organization_feed_view_model-library.html)
3. [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. buildNewPosts method

##### OrganizationFeedViewModel class





talawa
1.0.0+1






