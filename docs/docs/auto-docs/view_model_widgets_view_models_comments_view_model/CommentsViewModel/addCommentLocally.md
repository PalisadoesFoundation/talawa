::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_comments_view_model/CommentsViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [addCommentLocally]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [addCommentLocally]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [msg]{.parameter-name}]{#addCommentLocally-param-msg .parameter}

)
:::

::: {.section .desc .markdown}
This function add comment locally.

**params**:

-   `msg`: BuildContext, contain parent info

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void addCommentLocally(String msg) {
  _postService.addCommentLocally(_postID);
  final creator = _userConfig.currentUser;
  final Comment localComment = Comment(
    text: msg,
    createdAt: DateTime.now().toString(),
    creator: creator,
  );
  _commentlist.add(localComment);
  notifyListeners();
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
4.  addCommentLocally method

##### CommentsViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
