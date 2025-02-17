::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [navigateToPinnedPostPage]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [navigateToPinnedPostPage]{.name}()
:::

::: {.section .desc .markdown}
This function navigate to pinned post page.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void navigateToPinnedPostPage() {
  // uses `pushScreen` method by `navigationService` service.
  _navigationService.pushScreen(
    Routes.pinnedPostPage,
    arguments: _pinnedPosts,
  );
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
4.  navigateToPinnedPostPage method

##### OrganizationFeedViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
