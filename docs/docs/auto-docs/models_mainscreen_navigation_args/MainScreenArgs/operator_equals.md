<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [mainscreen_navigation_args](../../models_mainscreen_navigation_args/models_mainscreen_navigation_args-library.md)
3.  [MainScreenArgs](../../models_mainscreen_navigation_args/MainScreenArgs-class.md)
4.  operator == method

<div class="self-name">

operator ==

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="models_mainscreen_navigation_args/MainScreenArgs-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">operator ==</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)</span>
<span class="name">operator ==</span>(

1.  <span id="==-param-other"
    class="parameter"><span class="type-annotation">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)</span>
    <span class="parameter-name">other</span></span>

)

<div class="features">

<span class="feature">override</span>

</div>

</div>

<div class="section desc markdown">

Overrides the equality operator to compare instances of the
MainScreenArgs class.

Checks whether the `other` object is of the same type and compares its
properties: If all properties match, returns `true`; otherwise, returns
`false`.

**params**:

- `other`: The object to compare against this MainScreenArgs instance.

**returns**:

- `bool`: Returns `true` if the properties of both instances match;
  otherwise, `false`.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
bool operator ==(Object other) =>
    identical(this, other) ||
    other is MainScreenArgs &&
        other.fromSignUp == fromSignUp &&
        other.mainScreenIndex == mainScreenIndex &&
        other.toggleDemoMode == toggleDemoMode;
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [mainscreen_navigation_args](../../models_mainscreen_navigation_args/models_mainscreen_navigation_args-library.md)
3.  [MainScreenArgs](../../models_mainscreen_navigation_args/MainScreenArgs-class.md)
4.  operator == method

##### MainScreenArgs class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
