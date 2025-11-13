<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [widgets/event_search_delegate.dart](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildLeading method

<div class="self-name">

buildLeading

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="widgets_event_search_delegate/EventSearch-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">buildLeading</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span>
<span class="name">buildLeading</span>(

1.  <span id="buildLeading-param-context"
    class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span>
    <span class="parameter-name">context</span></span>

)

<div class="features">

<span class="feature">override</span>

</div>

</div>

<div class="section desc markdown">

A widget to display before the current query in the
[AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).

Typically an
[IconButton](https://api.flutter.dev/flutter/material/IconButton-class.html)
configured with a
[BackButtonIcon](https://api.flutter.dev/flutter/material/BackButtonIcon-class.html)
that exits the search with
[close](https://api.flutter.dev/flutter/material/SearchDelegate/close.html).
One can also use an
[AnimatedIcon](https://api.flutter.dev/flutter/material/AnimatedIcon-class.html)
driven by
[transitionAnimation](https://api.flutter.dev/flutter/material/SearchDelegate/transitionAnimation.html),
which animates from e.g. a hamburger menu to the back button as the
search overlay fades in.

Returns null if no widget should be shown.

See also:

- [AppBar.leading](https://api.flutter.dev/flutter/material/AppBar/leading.html),
  the intended use for the return value of this method.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
Widget buildLeading(BuildContext context) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_search_delegate](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildLeading method

##### EventSearch class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
