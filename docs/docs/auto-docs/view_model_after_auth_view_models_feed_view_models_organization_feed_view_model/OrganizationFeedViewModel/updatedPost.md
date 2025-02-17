::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [updatedPost]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [updatedPost]{.name}(

1.  [[[Post](../../models_post_post_model/Post-class.html)]{.type-annotation}
    [post]{.parameter-name}]{#updatedPost-param-post .parameter}

)
:::

::: {.section .desc .markdown}
This function updates the post.

**params**:

-   `post`: post object

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void updatedPost(Post post) {
  for (int i = 0; i < _posts.length; i++) {
    if (_posts[i].sId == post.sId) {
      _posts[i] = post;
      notifyListeners();
      break;
    }
  }
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
4.  updatedPost method

##### OrganizationFeedViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
