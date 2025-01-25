::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/app_localization.dart](../../utils_app_localization/)
3.  [AppLocalizations](../../utils_app_localization/AppLocalizations-class.html)
4.  translate method

::: self-name
translate
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_app_localization/AppLocalizations-class-sidebar.html" below-sidebar=""}
<div>

# [translate]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype}
[translate]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [key]{.parameter-name}]{#translate-param-key .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String? translate(String? key) {
  if (isTest) return key;

  // ignore: unnecessary_null_comparison
  if (key == null) {
    return '...';
  }
  return _localizedStrings[key];
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [app_localization](../../utils_app_localization/)
3.  [AppLocalizations](../../utils_app_localization/AppLocalizations-class.html)
4.  translate method

##### AppLocalizations class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
