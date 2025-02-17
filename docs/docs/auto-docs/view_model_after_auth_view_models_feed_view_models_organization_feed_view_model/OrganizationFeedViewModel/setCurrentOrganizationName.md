
<div>

# setCurrentOrganizationName method

</div>


void setCurrentOrganizationName(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    updatedOrganization]

)



This function sets the organization name after update.

more_info_if_required

**params**:

-   `updatedOrganization`: updated organization name.

**returns**: None



## Implementation

``` language-dart
void setCurrentOrganizationName(String updatedOrganization) {
  // if `updatedOrganization` is not same to `_currentOrgName`.
  if (updatedOrganization != _currentOrgName) {
    _isFetchingPosts = true;
    ;
    _userPosts.;
    _posts.;
    _renderedPostID.;
    _currentOrgName = updatedOrganization;
    ;
  }
  // _postService.;
}
```







1.  [talawa](../../index.html)
2.  [organization_feed_view_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4.  setCurrentOrganizationName method

##### OrganizationFeedViewModel class







