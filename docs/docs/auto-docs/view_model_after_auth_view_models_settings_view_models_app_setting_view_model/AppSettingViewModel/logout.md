::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/settings_view_models/app_setting_view_model.dart](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/)
3.  [AppSettingViewModel](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
4.  logout method

::: self-name
logout
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [logout]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[logout]{.name}()
:::

::: {.section .desc .markdown}
This method destroys the user\'s session or sign out the user from app,
The function asks for the confimation in Custom Alert Dialog.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> logout() async {
  // push custom alert dialog with the confirmation message.
  userConfig.userLogOut();
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [app_setting_view_model](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/)
3.  [AppSettingViewModel](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
4.  logout method

##### AppSettingViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
