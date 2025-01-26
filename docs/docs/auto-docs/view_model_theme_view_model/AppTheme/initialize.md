::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/theme_view_model.dart](../../view_model_theme_view_model/)
3.  [AppTheme](../../view_model_theme_view_model/AppTheme-class.html)
4.  initialize method

::: self-name
initialize
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_theme_view_model/AppTheme-class-sidebar.html" below-sidebar=""}
<div>

# [initialize]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialize]{.name}()
:::

::: {.section .desc .markdown}
Initializes the theme settings.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initialize() {
  _isDarkMode = true;
  _loadFromPrefs();
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [theme_view_model](../../view_model_theme_view_model/)
3.  [AppTheme](../../view_model_theme_view_model/AppTheme-class.html)
4.  initialize method

##### AppTheme class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
