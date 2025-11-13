<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [widgets/event_search_delegate.dart](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildSuggestions method

<div class="self-name">

buildSuggestions

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

# <span class="kind-method">buildSuggestions</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)</span>
<span class="name">buildSuggestions</span>(

1.  <span id="buildSuggestions-param-context"
    class="parameter"><span class="type-annotation">[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)</span>
    <span class="parameter-name">context</span></span>

)

<div class="features">

<span class="feature">override</span>

</div>

</div>

<div class="section desc markdown">

Suggestions shown in the body of the search page while the user types a
query into the search field.

The delegate method is called whenever the content of
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
changes. The suggestions should be based on the current
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
string. If the query string is empty, it is good practice to show
suggested queries based on past queries or the current context.

Usually, this method will return a
[ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)
with one
[ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html)
per suggestion. When
[ListTile.onTap](https://api.flutter.dev/flutter/material/ListTile/onTap.html)
is called,
[query](https://api.flutter.dev/flutter/material/SearchDelegate/query.html)
should be updated with the corresponding suggestion and the results page
should be shown by calling
[showResults](https://api.flutter.dev/flutter/material/SearchDelegate/showResults.html).

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
2.  [event_search_delegate](../../widgets_event_search_delegate/)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  buildSuggestions method

##### EventSearch class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
