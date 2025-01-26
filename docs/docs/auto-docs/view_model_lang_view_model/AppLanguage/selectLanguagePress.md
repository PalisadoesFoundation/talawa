::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/lang_view_model.dart](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4.  selectLanguagePress method

::: self-name
selectLanguagePress
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_lang_view_model/AppLanguage-class-sidebar.html" below-sidebar=""}
<div>

# [selectLanguagePress]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[selectLanguagePress]{.name}()
:::

::: {.section .desc .markdown}
Navigates the user after choosing lthe anguage.

This function navigate user to `/appSettingsPage` route if the user is
authenticated else navigate to `demoMode - /MainScreenPage` route.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> selectLanguagePress() async {
  if (userConfig.currentUser.id != 'null') {
    dbLanguageUpdate();
    navigationService.popAndPushScreen('/appSettingsPage', arguments: '');
  } else {
    navigationService.pushScreen(
      Routes.mainScreen,
      arguments: MainScreenArgs(
        mainScreenIndex: 0,
        fromSignUp: false,
        toggleDemoMode: true,
      ),
    );
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
4.  selectLanguagePress method

##### AppLanguage class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
