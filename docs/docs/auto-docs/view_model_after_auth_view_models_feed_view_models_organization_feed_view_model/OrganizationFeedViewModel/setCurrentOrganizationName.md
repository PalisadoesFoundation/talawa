::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [setCurrentOrganizationName]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [setCurrentOrganizationName]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [updatedOrganization]{.parameter-name}]{#setCurrentOrganizationName-param-updatedOrganization
    .parameter}

)
:::

::: {.section .desc .markdown}
This function sets the organization name after update.

more_info_if_required

**params**:

-   `updatedOrganization`: updated organization name.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [organization_feed_view_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4.  setCurrentOrganizationName method

##### OrganizationFeedViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
