::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_comments_view_model/CommentsViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [createComment]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[createComment]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [msg]{.parameter-name}]{#createComment-param-msg .parameter}

)
:::

::: {.section .desc .markdown}
This function add comment on the post. The function uses
`createComments` method provided by Comment Service.

**params**:

-   `msg`: The comment text.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> createComment(String msg) async {
  await actionHandlerService.performAction(
    actionType: ActionType.optimistic,
    action: () async {
      await _commentService.createComments(_postID, msg);
      return null;
    },
    updateUI: () {
      addCommentLocally(msg);
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
2.  [comments_view_model](../../view_model_widgets_view_models_comments_view_model/)
3.  [CommentsViewModel](../../view_model_widgets_view_models_comments_view_model/CommentsViewModel-class.html)
4.  createComment method

##### CommentsViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
