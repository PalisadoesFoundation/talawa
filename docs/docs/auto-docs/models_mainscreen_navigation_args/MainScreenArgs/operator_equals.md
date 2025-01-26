::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/mainscreen_navigation_args.dart](../../models_mainscreen_navigation_args/)
3.  [MainScreenArgs](../../models_mainscreen_navigation_args/MainScreenArgs-class.html)
4.  operator == method

::: self-name
operator ==
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_mainscreen_navigation_args/MainScreenArgs-class-sidebar.html" below-sidebar=""}
<div>

# [operator ==]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype}
[operator ==]{.name}(

1.  [[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation}
    [other]{.parameter-name}]{#==-param-other .parameter}

)

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Overrides the equality operator to compare instances of the
MainScreenArgs class.

Checks whether the `other` object is of the same type and compares its
properties: If all properties match, returns `true`; otherwise, returns
`false`.

**params**:

-   `other`: The object to compare against this MainScreenArgs instance.

**returns**:

-   `bool`: Returns `true` if the properties of both instances match;
    otherwise, `false`.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
bool operator ==(Object other) =>
    identical(this, other) ||
    other is MainScreenArgs &&
        other.fromSignUp == fromSignUp &&
        other.mainScreenIndex == mainScreenIndex &&
        other.toggleDemoMode == toggleDemoMode;
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [mainscreen_navigation_args](../../models_mainscreen_navigation_args/)
3.  [MainScreenArgs](../../models_mainscreen_navigation_args/MainScreenArgs-class.html)
4.  operator == method

##### MainScreenArgs class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
