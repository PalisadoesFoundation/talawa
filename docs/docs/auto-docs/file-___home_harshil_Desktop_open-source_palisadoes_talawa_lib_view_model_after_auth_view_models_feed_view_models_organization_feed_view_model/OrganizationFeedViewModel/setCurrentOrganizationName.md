




setCurrentOrganizationName method - OrganizationFeedViewModel class - organization\_feed\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/feed\_view\_models/organization\_feed\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. [OrganizationFeedViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. setCurrentOrganizationName method

setCurrentOrganizationName


dark\_mode

light\_mode




# setCurrentOrganizationName method


void
setCurrentOrganizationName(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) updatedOrganization

)

This function sets the organization name after update.

more\_info\_if\_required

**params**:

* `updatedOrganization`: updated organization name.

**returns**:
None


## Implementation

```
void setCurrentOrganizationName(String updatedOrganization) {
  // if `updatedOrganization` is not same to `_currentOrgName`.
  if (updatedOrganization != _currentOrgName) {
    _isFetchingPosts = true;
    notifyListeners();
    _userPosts.clear();
    _posts.clear();
    _renderedPostID.clear();
    _currentOrgName = updatedOrganization;
    notifyListeners();
  }
  // _postService.getPosts();
}
```

 


1. [talawa](../../index.html)
2. [organization\_feed\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3. [OrganizationFeedViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4. setCurrentOrganizationName method

##### OrganizationFeedViewModel class





talawa
1.0.0+1






