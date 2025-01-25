::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/lang_view_model.dart](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4.  changeLanguage method

::: self-name
changeLanguage
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_lang_view_model/AppLanguage-class-sidebar.html" below-sidebar=""}
<div>

# [changeLanguage]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[changeLanguage]{.name}(

1.  [[[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.html)]{.type-annotation}
    [type]{.parameter-name}]{#changeLanguage-param-type .parameter}

)
:::

::: {.section .desc .markdown}
This function change the app default language.

**params**:

-   `type`: `Locale` type, the language need to be updated with.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> changeLanguage(Locale type) async {
  // if the app language is of same [type].
  if (_appLocale == type) {
    return;
  }

  if (isTest) {
    _appLocale = type;
  } else {
    final prefs = await SharedPreferences.getInstance();
    if (type == const Locale("es")) {
      //If selected language is spanish
      _appLocale = const Locale("es");
      await prefs.setString('language_code', 'es');
      await prefs.setString('countryCode', 'ES');
    } else if (type == const Locale("fr")) {
      //If selected language is french
      _appLocale = const Locale("fr");
      await prefs.setString('language_code', 'fr');
      await prefs.setString('countryCode', 'FR');
    } else if (type == const Locale("hi")) {
      //If selected language is hindi
      _appLocale = const Locale("hi");
      await prefs.setString('language_code', 'hi');
      await prefs.setString('countryCode', 'IN');
    } else if (type == const Locale("zh")) {
      //If selected language is Chinese
      _appLocale = const Locale("zh");
      await prefs.setString('language_code', 'zh');
      await prefs.setString('countryCode', 'CN');
    } else if (type == const Locale("de")) {
      //If selected language is Chinese
      _appLocale = const Locale("de");
      await prefs.setString('language_code', 'de');
      await prefs.setString('countryCode', 'GE');
    } else if (type == const Locale("ja")) {
      //If selected language is Chinese
      _appLocale = const Locale("ja");
      await prefs.setString('language_code', 'ja');
      await prefs.setString('countryCode', 'JP');
    } else if (type == const Locale("pt")) {
      //If selected language is Chinese
      _appLocale = const Locale("pt");
      await prefs.setString('language_code', 'pt');
      await prefs.setString('countryCode', 'PT');
    } else {
      //If selected language is english
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
  }

  /// notifying the consumers
  notifyListeners();
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
4.  changeLanguage method

##### AppLanguage class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
