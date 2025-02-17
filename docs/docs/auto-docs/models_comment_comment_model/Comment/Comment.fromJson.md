:::::: {#dartdoc-main-content .main-content above-sidebar="models_comment_comment_model/Comment-class-sidebar.html" below-sidebar=""}
<div>

# [Comment.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[Comment.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json]{.parameter-name}]{#fromJson-param-json .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
factory Comment.fromJson(Map<String, dynamic> json) {
  return Comment(
    text: json['text'] as String?,
    createdAt: json['createdAt'] as String?,
    creator: json['creator'] == null
        ? null
        //Creating a new User instance from a map structure.
        : User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          ),
    post: json['post'] as String?,
    likeCount: json['likeCount'] as String?,
  );
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [comment_model](../../models_comment_comment_model/)
3.  [Comment](../../models_comment_comment_model/Comment-class.html)
4.  Comment.fromJson factory constructor

##### Comment class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
