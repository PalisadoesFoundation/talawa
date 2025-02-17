::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [updatePost]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [updatePost]{.name}(

1.  [[[Post](../../models_post_post_model/Post-class.html)]{.type-annotation}
    [post]{.parameter-name}]{#updatePost-param-post .parameter}

)
:::

::: {.section .desc .markdown}
function to update the Post.

**params**:

-   `post`: Post Object

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void updatePost(Post post) {
  if (_postID == post.sId) {
    _likedBy = post.likedBy!;
    checkAndSetTheIsLiked();
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [like_button_view_model](../../view_model_widgets_view_models_like_button_view_model/)
3.  [LikeButtonViewModel](../../view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class.html)
4.  updatePost method

##### LikeButtonViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
