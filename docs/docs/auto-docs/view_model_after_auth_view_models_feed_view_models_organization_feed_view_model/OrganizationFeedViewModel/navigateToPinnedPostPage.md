
<div>

# navigateToPinnedPostPage method

</div>


void 



This function navigate to pinned post page.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  // uses `pushScreen` method by `navigationService` service.
  _navigationService.pushScreen(
    Routes.pinnedPostPage,
    arguments: _pinnedPosts,
  );
}
```







1.  [talawa](../../index.md)
2.  [organization_feed_view_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.md)
4.  navigateToPinnedPostPage method

##### OrganizationFeedViewModel class







