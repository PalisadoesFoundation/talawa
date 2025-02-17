::::::: {#dartdoc-main-content .main-content above-sidebar="services_post_service/PostService-class-sidebar.html" below-sidebar=""}
<div>

# [addNewpost]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [addNewpost]{.name}(

1.  [[[Post](../../models_post_post_model/Post-class.html)]{.type-annotation}
    [newPost]{.parameter-name}]{#addNewpost-param-newPost .parameter}

)
:::

::: {.section .desc .markdown}
Method to add newly created post at the very top of the feed.

**params**:

-   `newPost`: new post made by user to add in feed

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void addNewpost(Post newPost) {
  if (!_posts.contains(newPost)) {
    _posts.insert(0, newPost);
  }
  _postStreamController.add(_posts);
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
4.  addNewpost method

##### PostService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
