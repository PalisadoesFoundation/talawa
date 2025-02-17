::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_feed_view_models_organization_feed_view_model/OrganizationFeedViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [removePost]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[removePost]{.name}(

1.  [[[Post](../../models_post_post_model/Post-class.html)]{.type-annotation}
    [post]{.parameter-name}]{#removePost-param-post .parameter}

)
:::

::: {.section .desc .markdown}
function to remove the post.

**params**:

-   `post`: post object

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> removePost(Post post) async {
  await actionHandlerService.performAction(
    actionType: ActionType.critical,
    criticalActionFailureMessage: TalawaErrors.postDeletionFailed,
    action: () async {
      final result = await _postService.deletePost(post);
      return result;
    },
    onValidResult: (result) async {
      _posts.remove(post);
    },
    apiCallSuccessUpdateUI: () {
      navigationService.pop();
      navigationService.showTalawaErrorSnackBar(
        'Post was deleted if you had the rights!',
        MessageType.info,
      );
      notifyListeners();
    },
  );
  await actionHandlerService.performAction(
    actionType: ActionType.critical,
    criticalActionFailureMessage: TalawaErrors.postDeletionFailed,
    action: () async {
      final result = await _postService.deletePost(post);
      return result;
    },
    onValidResult: (result) async {
      _posts.remove(post);
    },
    apiCallSuccessUpdateUI: () {
      navigationService.pop();
      navigationService.showTalawaErrorSnackBar(
        'Post was deleted if you had the rights!',
        MessageType.info,
      );
      notifyListeners();
    },
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
4.  removePost method

##### OrganizationFeedViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
