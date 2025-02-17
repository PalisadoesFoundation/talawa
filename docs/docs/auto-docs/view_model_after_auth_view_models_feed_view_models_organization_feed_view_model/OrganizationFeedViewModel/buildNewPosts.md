
<div>

# buildNewPosts method

</div>


void buildNewPosts(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.md)[\<[[Post](../../models_post_post_model/Post-class.md)]\>]]
    newPosts]

)



This function initialise `_posts` with `newPosts`.

more_info_if_required

**params**:

-   `newPosts`: new post

**returns**: None



## Implementation

``` language-dart
void buildNewPosts(List<Post> newPosts) {
  _posts = newPosts;
  final currentUserId = _userConfig.currentUser.id!;
  _userPosts.;
  for (final post in newPosts) {
    if (!_userPosts.any((element) => element.sId == post.sId) &&
        post.creator!.id == currentUserId) {
      _userPosts.insert(0, post);
    }
  }
  _isFetchingPosts = false;
  ;
}
```







1.  [talawa](../../index.md)
2.  [organization_feed_view_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.md)
4.  buildNewPosts method

##### OrganizationFeedViewModel class







