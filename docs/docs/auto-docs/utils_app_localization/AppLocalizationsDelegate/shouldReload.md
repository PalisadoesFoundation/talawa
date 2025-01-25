::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/app_localization.dart](../../utils_app_localization/)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4.  shouldReload method

::: self-name
shouldReload
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_app_localization/AppLocalizationsDelegate-class-sidebar.html" below-sidebar=""}
<div>

# [shouldReload]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype}
[shouldReload]{.name}(

1.  [covariant
    [[AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)]{.type-annotation}
    [old]{.parameter-name}]{#shouldReload-param-old .parameter}

)

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Returns true if the resources for this delegate should be loaded again
by calling the
[load](../../utils_app_localization/AppLocalizationsDelegate/load.html)
method.

This method is called whenever its
[Localizations](https://api.flutter.dev/flutter/widgets/Localizations-class.html)
widget is rebuilt. If it returns true then dependent widgets will be
rebuilt after
[load](../../utils_app_localization/AppLocalizationsDelegate/load.html)
has completed.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
bool shouldReload(AppLocalizationsDelegate old) => false;
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [app_localization](../../utils_app_localization/)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4.  shouldReload method

##### AppLocalizationsDelegate class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
