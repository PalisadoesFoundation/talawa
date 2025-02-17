::::::: {#dartdoc-main-content .main-content above-sidebar="services_post_service/PostService-class-sidebar.html" below-sidebar=""}
<div>

# [addLike]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[addLike]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [postID]{.parameter-name}]{#addLike-param-postID .parameter}

)
:::

::: {.section .desc .markdown}
Method to add like on a Post.

This method basically update likedBy list of a Post in database.

**params**:

-   `postID`: ID of the post to add like in database

**returns**:

-   `Future<void>`: define_the_return
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> addLike(String postID) async {
  bool isLiked = false;
  await actionHandlerService.performAction(
    actionType: ActionType.optimistic,
    action: () async {
      final String mutation = PostQueries().addLike();
      // run the graphQl mutation.
      return await _dbFunctions
          .gqlAuthMutation(mutation, variables: {"postID": postID});
      // return result
    },
    onValidResult: (result) async {
      isLiked = (result.data?["_id"] != null);
    },
    updateUI: () {
      _localAddLike(postID);
    },
  );
  return isLiked;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  addLike method

##### PostService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
