::::::: {#dartdoc-main-content .main-content above-sidebar="services_comment_service/CommentService-class-sidebar.html" below-sidebar=""}
<div>

# [createComments]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[createComments]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [postId]{.parameter-name}, ]{#createComments-param-postId
    .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [text]{.parameter-name}]{#createComments-param-text .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to add comment on the post.

To verify things are working, check out the native platform logs.
**params**:

-   `postId`: The post id on which comment is to be added.
-   `text`: The comment text.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> createComments(String postId, String text) async {
  final String createCommentQuery = CommentQueries().createComment();

  try {
    await _dbFunctions.gqlAuthMutation(
      createCommentQuery,
      variables: {
        'postId': postId, //Add your variables here
        'text': text,
      },
    );

    _navigationService.showTalawaErrorSnackBar(
      "Comment sent",
      MessageType.info,
    );
  } on Exception catch (_) {
    _navigationService.showTalawaErrorSnackBar(
      "Something went wrong",
      MessageType.error,
    );
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [comment_service](../../services_comment_service/)
3.  [CommentService](../../services_comment_service/CommentService-class.html)
4.  createComments method

##### CommentService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
