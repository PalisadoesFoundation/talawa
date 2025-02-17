::::::::: {#dartdoc-main-content .main-content above-sidebar="enums_enums/CachedUserActionStatusAdapter-class-sidebar.html" below-sidebar=""}
<div>

# [write]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[void]{.returntype} [write]{.name}(

1.  [[[BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html)]{.type-annotation}
    [writer]{.parameter-name}, ]{#write-param-writer .parameter}
2.  [[[CachedUserActionStatus](../../enums_enums/CachedUserActionStatus.html)]{.type-annotation}
    [obj]{.parameter-name}]{#write-param-obj .parameter}

)

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
Is called when a value has to be encoded.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
void write(BinaryWriter writer, CachedUserActionStatus obj) {
  switch (obj) {
    case CachedUserActionStatus.pending:
      writer.writeByte(0);
      break;
    case CachedUserActionStatus.completed:
      writer.writeByte(1);
      break;
  }
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [enums](../../enums_enums/)
3.  [CachedUserActionStatusAdapter](../../enums_enums/CachedUserActionStatusAdapter-class.html)
4.  write method

##### CachedUserActionStatusAdapter class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
