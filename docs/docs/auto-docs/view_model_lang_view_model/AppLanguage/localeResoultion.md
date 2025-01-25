::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/lang_view_model.dart](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4.  localeResoultion method

::: self-name
localeResoultion
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_lang_view_model/AppLanguage-class-sidebar.html" below-sidebar=""}
<div>

# [localeResoultion]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]{.returntype}
[localeResoultion]{.name}(

1.  [[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)?]{.type-annotation}
    [locale]{.parameter-name}, ]{#localeResoultion-param-locale
    .parameter}
2.  [[[Iterable](https://api.flutter.dev/flutter/dart-core/Iterable-class.html)[\<[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [supportedLocales]{.parameter-name}]{#localeResoultion-param-supportedLocales
    .parameter}

)
:::

::: {.section .desc .markdown}
This function fetches the appropriate locale for the user\'s app based
on the provided locale and supported locales.

**params**:

-   `locale`: (`Locale?`): The locale to be resolved. Can be null.
-   `supportedLocales`: (`Iterable<Locale>`): The list of supported
    locales in the app.

**returns**:

-   `Locale`: The resolved locale that matches either the language code
    or the country code of the provided locale. If no match is found or
    the provided locale is null, the first supported locale is returned.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Locale localeResoultion(Locale? locale, Iterable<Locale> supportedLocales) {
  if (locale == null) {
    debugPrint("*language locale is null!!!");
    return supportedLocales.first;
  }
  for (final Locale supportedLocale in supportedLocales) {
    if (supportedLocale.languageCode == locale.languageCode ||
        supportedLocale.countryCode == locale.countryCode) {
      return supportedLocale;
    }
  }
  return supportedLocales.first;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [lang_view_model](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4.  localeResoultion method

##### AppLanguage class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
