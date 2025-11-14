<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [app_localization](../../utils_app_localization/utils_app_localization-library.md)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.md)
4.  load method

<div class="self-name">

load

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_app_localization/AppLocalizationsDelegate-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">load</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[AppLocalizations](../../utils_app_localization/AppLocalizations-class.md)</span>\></span></span>
<span class="name">load</span>(

1.  <span id="load-param-locale"
    class="parameter"><span class="type-annotation">[Locale](https://api.flutter.dev/flutter/dart-ui/Locale-class.md)</span>
    <span class="parameter-name">locale</span></span>

)

</div>

<div class="section desc markdown">

Start loading the resources for `locale`. The returned future completes
when the resources have finished loading.

It's assumed that this method will return an object that contains a
collection of related string resources (typically defined with one
method per resource). The object will be retrieved with
`Localizations.of`.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
Future<AppLocalizations> load(Locale locale) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [app_localization](../../utils_app_localization/utils_app_localization-library.md)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.md)
4.  load method

##### AppLocalizationsDelegate class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
