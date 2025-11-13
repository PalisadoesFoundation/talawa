<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/app_localization.dart](../../utils_app_localization/)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.md)
4.  isSupported method

<div class="self-name">

isSupported

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_app_localization/AppLocalizationsDelegate-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">isSupported</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>
<span class="name">isSupported</span>(

1.  <span id="isSupported-param-locale"
    class="parameter"><span class="type-annotation">[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.md)</span>
    <span class="parameter-name">locale</span></span>

)

<div class="features">

<span class="feature">override</span>

</div>

</div>

<div class="section desc markdown">

Whether resources for the given locale can be loaded by this delegate.

Return true if the instance of `T` loaded by this delegate's
[load](../../utils_app_localization/AppLocalizationsDelegate/load.md)
method supports the given `locale`'s language.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
bool isSupported(Locale locale) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [app_localization](../../utils_app_localization/)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.md)
4.  isSupported method

##### AppLocalizationsDelegate class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
