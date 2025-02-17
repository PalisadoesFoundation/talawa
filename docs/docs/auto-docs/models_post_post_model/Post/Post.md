:::::: {#dartdoc-main-content .main-content above-sidebar="models_post_post_model/Post-class-sidebar.html" below-sidebar=""}
<div>

# [Post]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[Post]{.name}({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [sId]{.parameter-name}, ]{#-param-sId .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [description]{.parameter-name}, ]{#-param-description .parameter}
3.  [[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]{.type-annotation}
    [createdAt]{.parameter-name}, ]{#-param-createdAt .parameter}
4.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [imageUrl]{.parameter-name}, ]{#-param-imageUrl .parameter}
5.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [base64String]{.parameter-name}, ]{#-param-base64String .parameter}
6.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [videoUrl]{.parameter-name}, ]{#-param-videoUrl .parameter}
7.  [required
    [[User](../../models_user_user_info/User-class.html)?]{.type-annotation}
    [creator]{.parameter-name}, ]{#-param-creator .parameter}
8.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)?]{.type-annotation}
    [organization]{.parameter-name}, ]{#-param-organization .parameter}
9.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[LikedBy](../../models_post_post_model/LikedBy-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation}
    [likedBy]{.parameter-name}, ]{#-param-likedBy .parameter}
10. [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Comments](../../models_post_post_model/Comments-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation}
    [comments]{.parameter-name}, ]{#-param-comments .parameter}

})
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Post({
  required this.sId,
  this.description,
  this.createdAt,
  this.imageUrl,
  this.base64String,
  this.videoUrl,
  required this.creator,
  this.organization,
  this.likedBy,
  this.comments,
});
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_model](../../models_post_post_model/)
3.  [Post](../../models_post_post_model/Post-class.html)
4.  Post constructor

##### Post class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
