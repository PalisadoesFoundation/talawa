::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/app_localization.dart](../../utils_app_localization/)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4.  isSupported method

::: self-name
isSupported
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_app_localization/AppLocalizationsDelegate-class-sidebar.html" below-sidebar=""}
<div>

# [isSupported]{.kind-method} method

</div>

::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype}
[isSupported]{.name}(

1.  [[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]{.type-annotation}
    [locale]{.parameter-name}]{#isSupported-param-locale .parameter}

)

::: features
[override]{.feature}
:::
:::

::: {.section .desc .markdown}
Whether resources for the given locale can be loaded by this delegate.

Return true if the instance of `T` loaded by this delegate\'s
[load](../../utils_app_localization/AppLocalizationsDelegate/load.html)
method supports the given `locale`\'s language.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
bool isSupported(Locale locale) {
  // Include all of your supported language codes here
  return ['en', 'es', 'fr', 'hi', 'zh', 'de', 'ja', 'pt']
      .contains(locale.languageCode);
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [app_localization](../../utils_app_localization/)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.html)
4.  isSupported method

##### AppLocalizationsDelegate class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
