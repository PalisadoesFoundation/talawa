:::::::::: {#dartdoc-main-content .main-content above-sidebar="models_mainscreen_navigation_args/MainScreenArgs-class-sidebar.html" below-sidebar=""}
<div>

# [hashCode]{.kind-property} property

</div>

:::::::: {#getter .section}
::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.returntype}
get [hashCode]{.name}

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
Overrides the hashCode getter to generate a hash code based on the
properties of the MainScreenArgs instance.

Returns an integer value representing the combined hash codes.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
int get hashCode =>
    fromSignUp.hashCode ^ mainScreenIndex.hashCode ^ toggleDemoMode.hashCode;
```
:::
::::::::
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [mainscreen_navigation_args](../../models_mainscreen_navigation_args/)
3.  [MainScreenArgs](../../models_mainscreen_navigation_args/MainScreenArgs-class.html)
4.  hashCode property

##### MainScreenArgs class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
