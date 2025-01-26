::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [enums/enums.dart](../../enums_enums/)
3.  [CachedOperationTypeAdapter](../../enums_enums/CachedOperationTypeAdapter-class.html)
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
::: {#dartdoc-main-content .main-content above-sidebar="enums_enums/CachedOperationTypeAdapter-class-sidebar.html" below-sidebar=""}
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
2.  [[[CachedOperationType](../../enums_enums/CachedOperationType.html)]{.type-annotation}
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
void write(BinaryWriter writer, CachedOperationType obj) {
  switch (obj) {
    case CachedOperationType.gqlAuthQuery:
      writer.writeByte(0);
      break;
    case CachedOperationType.gqlAuthMutation:
      writer.writeByte(1);
      break;
    case CachedOperationType.gqlNonAuthQuery:
      writer.writeByte(2);
      break;
    case CachedOperationType.gqlNonAuthMutation:
      writer.writeByte(3);
      break;
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [enums](../../enums_enums/)
3.  [CachedOperationTypeAdapter](../../enums_enums/CachedOperationTypeAdapter-class.html)
4.  write method

##### CachedOperationTypeAdapter class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
