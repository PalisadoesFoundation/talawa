<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [app_setting_view_model](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/view_model_after_auth_view_models_settings_view_models_app_setting_view_model-library.md)
3.  [AppSettingViewModel](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.md)
4.  launchWebsite method

<div class="self-name">

launchWebsite

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">launchWebsite</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>\></span></span>
<span class="name">launchWebsite</span>(

1.  <span id="launchWebsite-param-url"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">url</span></span>

)

</div>

<div class="section desc markdown">

Launches a website using the provided URL.

**params**:

- `url`: A
  [String](https://api.flutter.dev/flutter/dart-core/String-class.html)
  representing the URL of the website to be launched.

**returns**:

- `Future<bool>`: A
  [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)
  that resolves to a `bool` value indicating whether the website launch
  was successful.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<bool> launchWebsite(String url) async => await launchUrlString(url);
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [app_setting_view_model](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/view_model_after_auth_view_models_settings_view_models_app_setting_view_model-library.md)
3.  [AppSettingViewModel](../../view_model_after_auth_view_models_settings_view_models_app_setting_view_model/AppSettingViewModel-class.md)
4.  launchWebsite method

##### AppSettingViewModel class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
