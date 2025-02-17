::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_widgets_view_models_like_button_view_model/LikeButtonViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialize]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialize]{.name}(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[LikedBy](../../models_post_post_model/LikedBy-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [likedBy]{.parameter-name}, ]{#initialize-param-likedBy .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [postID]{.parameter-name}]{#initialize-param-postID .parameter}

)
:::

::: {.section .desc .markdown}
First function to initialize the ViewModel.

**params**:

-   `likedBy`: List of LikedBy Objects
-   `postID`: Post Id of the Post

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initialize(List<LikedBy> likedBy, String postID) {
  _postID = postID;
  _user = _userConfig.currentUser;
  _likedBy = likedBy;
  notifyListeners();
  checkAndSetTheIsLiked();
  _updatePostSubscription =
      _postService.updatedPostStream.listen((post) => updatePost(post));
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
4.  initialize method

##### LikeButtonViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
