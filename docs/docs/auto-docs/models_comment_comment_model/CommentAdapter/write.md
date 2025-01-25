::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/comment/comment_model.dart](../../models_comment_comment_model/)
3.  [CommentAdapter](../../models_comment_comment_model/CommentAdapter-class.html)
4.  write method

::: self-name
write
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_comment_comment_model/CommentAdapter-class-sidebar.html" below-sidebar=""}
<div>

# [write]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[void]{.returntype} [write]{.name}(

1.  [[[BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html)]{.type-annotation}
    [writer]{.parameter-name}, ]{#write-param-writer .parameter}
2.  [[[Comment](../../models_comment_comment_model/Comment-class.html)]{.type-annotation}
    [obj]{.parameter-name}]{#write-param-obj .parameter}

)

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Is called when a value has to be encoded.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
void write(BinaryWriter writer, Comment obj) {
  writer
    ..writeByte(5)
    ..writeByte(0)
    ..write(obj.text)
    ..writeByte(1)
    ..write(obj.createdAt)
    ..writeByte(2)
    ..write(obj.creator)
    ..writeByte(3)
    ..write(obj.post)
    ..writeByte(4)
    ..write(obj.likeCount);
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [comment_model](../../models_comment_comment_model/)
3.  [CommentAdapter](../../models_comment_comment_model/CommentAdapter-class.html)
4.  write method

##### CommentAdapter class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
