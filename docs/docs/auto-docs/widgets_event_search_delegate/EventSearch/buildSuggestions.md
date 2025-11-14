<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [event_search_delegate](../../widgets_event_search_delegate/widgets_event_search_delegate-library.md)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildSuggestions method

<div class="self-name">

buildSuggestions

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="widgets_event_search_delegate/EventSearch-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">buildSuggestions</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">Widget</span>
<span class="name">buildSuggestions</span>(

1.  <span id="buildSuggestions-param-context"
    class="parameter"><span class="type-annotation">BuildContext</span>
    <span class="parameter-name">context</span></span>

)

</div>

<div class="section desc markdown">

Suggestions shown in the body of the search page while the user types a
query into the search field.

The delegate method is called whenever the content of
[query](../../widgets_event_search_delegate/EventSearch/query.md)
changes. The suggestions should be based on the current
[query](../../widgets_event_search_delegate/EventSearch/query.md)
string. If the query string is empty, it is good practice to show
suggested queries based on past queries or the current context.

Usually, this method will return a `ListView` with one `ListTile` per
suggestion. When `ListTile.onTap` is called,
[query](../../widgets_event_search_delegate/EventSearch/query.md)
should be updated with the corresponding suggestion and the results page
should be shown by calling
[showResults](../../widgets_event_search_delegate/EventSearch/showResults.md).

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
Widget buildSuggestions(BuildContext context) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_search_delegate](../../widgets_event_search_delegate/widgets_event_search_delegate-library.md)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildSuggestions method

##### EventSearch class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
