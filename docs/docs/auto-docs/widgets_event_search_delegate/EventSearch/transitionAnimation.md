<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [widgets/event_search_delegate.dart](../../widgets_event_search_delegate/widgets_event_search_delegate-library.md)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  transitionAnimation property

<div class="self-name">

transitionAnimation

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="widgets_event_search_delegate/EventSearch-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-property">transitionAnimation</span> property

</div>

<div id="getter" class="section">

<div class="section multi-line-signature">

<span class="returntype">Animation<span class="signature">\<<span class="type-parameter">[double](https://api.flutter.dev/flutter/dart-core/double-class.html)</span>\></span></span>
<span class="name">transitionAnimation</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

`Animation` triggered when the search pages fades in or out.

This animation is commonly used to animate `AnimatedIcon`s of
`IconButton`s returned by
[buildLeading](../../widgets_event_search_delegate/EventSearch/buildLeading.md)
or
[buildActions](../../widgets_event_search_delegate/EventSearch/buildActions.md).
It can also be used to animate `IconButton`s contained within the route
below the search page.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Animation<double> get transitionAnimation => _proxyAnimation;
```

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_search_delegate](../../widgets_event_search_delegate/widgets_event_search_delegate-library.md)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  transitionAnimation property

##### EventSearch class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
