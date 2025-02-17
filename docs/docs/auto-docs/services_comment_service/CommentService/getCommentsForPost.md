::::::: {#dartdoc-main-content .main-content above-sidebar="services_comment_service/CommentService-class-sidebar.html" below-sidebar=""}
<div>

# [getCommentsForPost]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[getCommentsForPost]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [postId]{.parameter-name}]{#getCommentsForPost-param-postId
    .parameter}

)
:::

::: {.section .desc .markdown}
This function is used to get all comments on the post.

To verify things are working, check out the native platform logs.
**params**:

-   `postId`: The post id for which comments are to be fetched.

**returns**:

-   `Future<List<dynamic>>`: promise that will be fulfilled with list of
    comments.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<List<dynamic>> getCommentsForPost(String postId) async {
  final String getCommmentQuery = CommentQueries().getPostsComments(postId);

  final QueryResult<Object?> result =
      await _dbFunctions.gqlAuthMutation(getCommmentQuery);

  if (result.data == null) {
    return [];
  }
  final resultData = result.data;

  final resultDataPostComments = (resultData?['post']
      as Map<String, dynamic>)['comments'] as List<dynamic>;
  return resultDataPostComments;
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
4.  getCommentsForPost method

##### CommentService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
