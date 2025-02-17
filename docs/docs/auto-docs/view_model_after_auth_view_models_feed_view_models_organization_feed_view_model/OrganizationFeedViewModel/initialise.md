::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialise]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialise]{.name}({

1.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [isTest]{.parameter-name} = [false]{.default-value},
    ]{#initialise-param-isTest .parameter}

})
:::

::: {.section .desc .markdown}
To initialize the view model.

more_info_if_required

**params**:

-   `isTest`: for test

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [organization_feed_view_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4.  initialise method

##### OrganizationFeedViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
