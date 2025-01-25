::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/app_localization.dart](../../utils_app_localization/)
3.  [AppLocalizations](../../utils_app_localization/AppLocalizations-class.html)
4.  strictTranslate method

::: self-name
strictTranslate
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_app_localization/AppLocalizations-class-sidebar.html" below-sidebar=""}
<div>

# [strictTranslate]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[strictTranslate]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [key]{.parameter-name}]{#strictTranslate-param-key .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String strictTranslate(String key) {
  if (isTest) return key;

  // ignore: unnecessary_null_comparison
  if (key == null) {
    return '...';
  }

  final String translate = _localizedStrings[key] ?? key;
  return translate;
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
4.  strictTranslate method

##### AppLocalizations class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
