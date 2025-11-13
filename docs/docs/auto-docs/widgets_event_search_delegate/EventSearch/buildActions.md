<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [widgets/event_search_delegate.dart](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildActions method

<div class="self-name">

buildActions

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

# <span class="kind-method">buildActions</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span>\></span></span>
<span class="name">buildActions</span>(

1.  <span id="buildActions-param-context"
    class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span>
    <span class="parameter-name">context</span></span>

)

<div class="features">

<span class="feature">override</span>

</div>

</div>

<div class="section desc markdown">

Widgets to display after the search query in the
[AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html).

If the
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
is not empty, this should typically contain a button to clear the query
and show the suggestions again (via
[showSuggestions](https://api.flutter.dev/flutter/material/SearchDelegate/showSuggestions.md))
if the results are currently shown.

Returns null if no widget should be shown.

See also:

- [AppBar.actions](https://api.flutter.dev/flutter/material/AppBar/actions.html),
  the intended use for the return value of this method.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
List<Widget> buildActions(BuildContext context) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_search_delegate](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildActions method

##### EventSearch class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
