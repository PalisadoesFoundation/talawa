




initialise method - OrganizationFeedViewModel class - organization\_feed\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/feed\_view\_models/organization\_feed\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. [OrganizationFeedViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


void
initialise({

1. [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isTest = false,

})

To initialize the view model.

more\_info\_if\_required

**params**:

* `isTest`: for test

**returns**:
None


## Implementation

```
void initialise({
  bool isTest = false,
}) {
  _isFetchingPosts = true;

  // For caching/initializing the current organization after the stream subscription has canceled and the stream is updated
  _currentOrgName = _userConfig.currentOrg.name!;
  // ------
  // Attaching the stream subscription to rebuild the widgets automatically
  _currentOrganizationStreamSubscription =
      _userConfig.currentOrgInfoStream.listen(
    (updatedOrganization) =>
        setCurrentOrganizationName(updatedOrganization.name!),
  );
  _postsSubscription = _postService.postStream.listen((newPosts) {
    return buildNewPosts(newPosts);
  });

  _updatePostSubscription =
      _postService.updatedPostStream.listen((post) => updatedPost(post));

  _postService.fetchPostsInitial();
  if (isTest) {
    istest = true;
  }
  _isFetchingPosts = false;
}
```

 


1. [talawa](../../index.html)
2. [organization\_feed\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. [OrganizationFeedViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. initialise method

##### OrganizationFeedViewModel class





talawa
1.0.0+1






