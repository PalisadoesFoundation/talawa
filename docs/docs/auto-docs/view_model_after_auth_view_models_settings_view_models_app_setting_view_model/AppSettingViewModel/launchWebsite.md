::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/settings_view_models/app_setting_view_model.dart](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/)
3.  [AppSettingViewModel](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
4.  launchWebsite method

::: self-name
launchWebsite
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [launchWebsite]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[launchWebsite]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [url]{.parameter-name}]{#launchWebsite-param-url .parameter}

)
:::

::: {.section .desc .markdown}
Launches a website using the provided URL.

**params**:

-   `url`: A
    [String](https://api.flutter.dev/flutter/dart-core/String-class.html)
    representing the URL of the website to be launched.

**returns**:

-   `Future<bool>`: A
    [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)
    that resolves to a
    [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)
    value indicating whether the website launch was successful.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> launchWebsite(String url) async => await launchUrlString(url);
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [app_setting_view_model](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/)
3.  [AppSettingViewModel](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.html)
4.  launchWebsite method

##### AppSettingViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
