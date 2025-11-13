<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/app_localization.dart](../../utils_app_localization/utils_app_localization-library.md)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.md)
4.  type property

<div class="self-name">

type

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_app_localization/AppLocalizationsDelegate-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-property">type</span> property

</div>

<div id="getter" class="section">

<div class="section multi-line-signature">

<span class="returntype">[Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)</span>
<span class="name">type</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

The type of the object returned by the
[load](../../utils_app_localization/AppLocalizationsDelegate/load.md)
method, T by default.

This type is used to retrieve the object "loaded" by this
`LocalizationsDelegate` from the `Localizations` inherited widget. For
example the object loaded by `LocalizationsDelegate<Foo>` would be
retrieved with:

``` language-dart
Foo foo = Localizations.of<Foo>(context, Foo)!;
```

It's rarely necessary to override this getter.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Type get type => T;
```

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [app_localization](../../utils_app_localization/utils_app_localization-library.md)
3.  [AppLocalizationsDelegate](../../utils_app_localization/AppLocalizationsDelegate-class.md)
4.  type property

##### AppLocalizationsDelegate class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
