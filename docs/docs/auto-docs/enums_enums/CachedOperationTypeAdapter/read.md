::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [enums/enums.dart](../../enums_enums/)
3.  [CachedOperationTypeAdapter](../../enums_enums/CachedOperationTypeAdapter-class.html)
4.  read method

::: self-name
read
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="enums_enums/CachedOperationTypeAdapter-class-sidebar.html" below-sidebar=""}
<div>

# [read]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[CachedOperationType](../../enums_enums/CachedOperationType.html)]{.returntype}
[read]{.name}(

1.  [[[BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html)]{.type-annotation}
    [reader]{.parameter-name}]{#read-param-reader .parameter}

)

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Is called when a value has to be decoded.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
CachedOperationType read(BinaryReader reader) {
  switch (reader.readByte()) {
    case 0:
      return CachedOperationType.gqlAuthQuery;
    case 1:
      return CachedOperationType.gqlAuthMutation;
    case 2:
      return CachedOperationType.gqlNonAuthQuery;
    case 3:
      return CachedOperationType.gqlNonAuthMutation;
    default:
      return CachedOperationType.gqlAuthQuery;
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
4.  read method

##### CachedOperationTypeAdapter class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
