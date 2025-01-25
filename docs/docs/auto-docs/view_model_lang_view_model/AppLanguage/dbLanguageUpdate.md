::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/lang_view_model.dart](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4.  dbLanguageUpdate method

::: self-name
dbLanguageUpdate
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_lang_view_model/AppLanguage-class-sidebar.html" below-sidebar=""}
<div>

# [dbLanguageUpdate]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[dbLanguageUpdate]{.name}()
:::

::: {.section .desc .markdown}
This function updates the Database Language by running the graphQL
`mutations`.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> dbLanguageUpdate() async {
  try {
    await databaseFunctions
        .gqlAuthMutation(queries.updateLanguage(_appLocale.languageCode));
    print('Language Updated in Database');
  } catch (e) {
    print(e);
  }
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
4.  dbLanguageUpdate method

##### AppLanguage class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
