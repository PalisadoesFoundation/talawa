::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/post_service.dart](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  removeLike method

::: self-name
removeLike
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_post_service/PostService-class-sidebar.html" below-sidebar=""}
<div>

# [removeLike]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[removeLike]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [postID]{.parameter-name}]{#removeLike-param-postID .parameter}

)
:::

::: {.section .desc .markdown}
Method to remove like in a Post.

This method basically update likedBy list of a Post and removes the like
of a user in database.

**params**:

-   `postID`: ID of the post to remove like in database.

**returns**:

-   `Future<void>`: nothing
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> removeLike(String postID) async {
  bool isLiked = false;
  await actionHandlerService.performAction(
    actionType: ActionType.optimistic,
    action: () async {
      final String mutation = PostQueries().removeLike();
      return await _dbFunctions
          .gqlAuthMutation(mutation, variables: {"postID": postID});
    },
    onValidResult: (result) async {
      isLiked = (result.data?["_id"] != null);
    },
    updateUI: () {
      _removeLocal(postID);
    },
  );
  return isLiked;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  removeLike method

##### PostService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
