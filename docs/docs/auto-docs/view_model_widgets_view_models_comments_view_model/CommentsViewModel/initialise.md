::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_comments_view_model/CommentsViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialise]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[initialise]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [postID]{.parameter-name}]{#initialise-param-postID .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to initialise the CommentViewModel.

To verify things are working, check out the native platform logs.
**params**:

-   `postID`: The post id for which comments are to be fetched.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> initialise(String postID) async {
  _commentlist = [];
  _postID = postID;
  _commentService = locator<CommentService>();
  _userConfig = locator<UserConfig>();
  _postService = locator<PostService>();
  notifyListeners();
  await getComments();
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [comments_view_model](../../view_model_widgets_view_models_comments_view_model/)
3.  [CommentsViewModel](../../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4.  initialise method

##### CommentsViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
