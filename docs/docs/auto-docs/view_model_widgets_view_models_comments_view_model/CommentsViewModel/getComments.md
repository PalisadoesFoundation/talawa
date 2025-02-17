::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_comments_view_model/CommentsViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [getComments]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[getComments]{.name}()
:::

::: {.section .desc .markdown}
This function is used to get all comments on the post.

To verify things are working, check out the native platform logs.
**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> getComments() async {
  setState(ViewState.busy);
  final List commentsJSON = await _commentService.getCommentsForPost(_postID);
  print(commentsJSON);
  commentsJSON.forEach((commentJson) {
    _commentlist.add(Comment.fromJson(commentJson as Map<String, dynamic>));
  });
  setState(ViewState.idle);
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
4.  getComments method

##### CommentsViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
