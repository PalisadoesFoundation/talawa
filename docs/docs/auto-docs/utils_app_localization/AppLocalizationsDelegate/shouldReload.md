<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/app_localization.dart](../../utils_app_localization/)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.md)
4.  shouldReload method

<div class="self-name">

shouldReload

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

# <span class="kind-method">shouldReload</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>
<span class="name">shouldReload</span>(

1.  <span id="shouldReload-param-old" class="parameter">covariant
    <span class="type-annotation">[AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.md)</span>
    <span class="parameter-name">old</span></span>

)

<div class="features">

<span class="feature">override</span>

</div>

</div>

<div class="section desc markdown">

Returns true if the resources for this delegate should be loaded again
by calling the
[load](../../utils_app_localization/AppLocalizationsDelegate/load.md)
method.

This method is called whenever its
[Localizations](https://api.flutter.dev/flutter/widgets/Localizations-class.html)
widget is rebuilt. If it returns true then dependent widgets will be
rebuilt after
[load](../../utils_app_localization/AppLocalizationsDelegate/load.md)
has completed.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
bool shouldReload(AppLocalizationsDelegate old) => false;
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [app_localization](../../utils_app_localization/)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.md)
4.  shouldReload method

##### AppLocalizationsDelegate class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
