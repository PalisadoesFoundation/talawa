::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/app_localization.dart](../../utils_app_localization/)
3.  [AppLocalizations](../../utils_app_localization/AppLocalizations-class.html)
4.  load method

::: self-name
load
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_app_localization/AppLocalizations-class-sidebar.html" below-sidebar=""}
<div>

# [load]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[load]{.name}()
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> load() async {
  // Load the language JSON file from the "lang" folder
  final String jsonString =
      await rootBundle.loadString('lang/${locale.languageCode}.json');
  final Map<String, dynamic> jsonMap =
      json.decode(jsonString) as Map<String, dynamic>;

  _localizedStrings = jsonMap.map((key, value) {
    return MapEntry(key, value.toString());
  });

  return true;
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
4.  load method

##### AppLocalizations class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
