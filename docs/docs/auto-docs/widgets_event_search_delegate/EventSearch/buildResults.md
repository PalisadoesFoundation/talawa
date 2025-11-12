<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [widgets/event_search_delegate.dart](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildResults method

<div class="self-name">

buildResults

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

# <span class="kind-method">buildResults</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span>
<span class="name">buildResults</span>(

1.  <span id="buildResults-param-context"
    class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span>
    <span class="parameter-name">context</span></span>

)

<div class="features">

<span class="feature">override</span>

</div>

</div>

<div class="section desc markdown">

The results shown after the user submits a search from the search page.

The current value of
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
can be used to determine what the user searched for.

This method might be applied more than once to the same query. If your
[buildResults](../../widgets_event_search_delegate/EventSearch/buildResults.md)
method is computationally expensive, you may want to cache the search
results for one or more queries.

Typically, this method returns a
[ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)
with the search results. When the user taps on a particular search
result,
[close](https://api.flutter.dev/flutter/material/SearchDelegate/close.html)
should be called with the selected result as argument. This will close
the search page and communicate the result back to the initial caller of
[showSearch](https://api.flutter.dev/flutter/material/showSearch.html).

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
Widget buildResults(BuildContext context) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_search_delegate](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildResults method

##### EventSearch class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
