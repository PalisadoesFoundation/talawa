::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_theme_view_model/AppTheme-class-sidebar.html" below-sidebar=""}
<div>

# [switchTheme]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [switchTheme]{.name}({

1.  [required
    [[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [isOn]{.parameter-name}, ]{#switchTheme-param-isOn .parameter}

})
:::

::: {.section .desc .markdown}
This function switches the app theme.

**params**:

-   `isOn`: `bool` type, the state to switch the theme to (true for
    Dark, false for Light).

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void switchTheme({required bool isOn}) {
  _isDarkMode = isOn;
  _saveToPrefs();
  notifyListeners();
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [theme_view_model](../../view_model_theme_view_model/)
3.  [AppTheme](../../view_model_theme_view_model/AppTheme-class.html)
4.  switchTheme method

##### AppTheme class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
