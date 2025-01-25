




navigateToPinnedPostPage method - OrganizationFeedViewModel class - organization\_feed\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/feed\_view\_models/organization\_feed\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. [OrganizationFeedViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. navigateToPinnedPostPage method

navigateToPinnedPostPage


dark\_mode

light\_mode




# navigateToPinnedPostPage method


void
navigateToPinnedPostPage()

This function navigate to pinned post page.

**params**:
None

**returns**:
None


## Implementation

```
void navigateToPinnedPostPage() {
  // uses `pushScreen` method by `navigationService` service.
  _navigationService.pushScreen(
    Routes.pinnedPostPage,
    arguments: _pinnedPosts,
  );
}
```

 


1. [talawa](../../index.html)
2. [organization\_feed\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. [OrganizationFeedViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. navigateToPinnedPostPage method

##### OrganizationFeedViewModel class





talawa
1.0.0+1






