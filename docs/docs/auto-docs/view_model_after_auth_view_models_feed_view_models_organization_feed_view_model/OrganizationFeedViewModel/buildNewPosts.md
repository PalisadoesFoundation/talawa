::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/feed_view_models/organization_feed_view_model.dart](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4.  buildNewPosts method

::: self-name
buildNewPosts
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [buildNewPosts]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [buildNewPosts]{.name}(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Post](../../models_post_post_model/Post-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [newPosts]{.parameter-name}]{#buildNewPosts-param-newPosts
    .parameter}

)
:::

::: {.section .desc .markdown}
This function initialise `_posts` with `newPosts`.

more_info_if_required

**params**:

-   `newPosts`: new post

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void buildNewPosts(List<Post> newPosts) {
  _posts = newPosts;
  final currentUserId = _userConfig.currentUser.id!;
  _userPosts.clear();
  for (final post in newPosts) {
    if (!_userPosts.any((element) => element.sId == post.sId) &&
        post.creator!.id == currentUserId) {
      _userPosts.insert(0, post);
    }
  }
  _isFetchingPosts = false;
  notifyListeners();
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [organization_feed_view_model](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/)
3.  [OrganizationFeedViewModel](../../view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class.html)
4.  buildNewPosts method

##### OrganizationFeedViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
