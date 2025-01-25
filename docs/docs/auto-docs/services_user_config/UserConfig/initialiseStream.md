::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/user_config.dart](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  initialiseStream method

::: self-name
initialiseStream
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_user_config/UserConfig-class-sidebar.html" below-sidebar=""}
<div>

# [initialiseStream]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialiseStream]{.name}()
:::

::: {.section .desc .markdown}
initialise.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initialiseStream() {
  _currentOrgInfoStream =
      _currentOrgInfoController.stream.asBroadcastStream();
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  initialiseStream method

##### UserConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
