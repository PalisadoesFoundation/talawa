<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [event_search_delegate](../../widgets_event_search_delegate/widgets_event_search_delegate-library.md)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  showResults method

<div class="self-name">

showResults

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

# <span class="kind-method">showResults</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">void</span>
<span class="name">showResults</span>(

1.  <span id="showResults-param-context"
    class="parameter"><span class="type-annotation">BuildContext</span>
    <span class="parameter-name">context</span></span>

)

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Transition from the suggestions returned by
[buildSuggestions](../../widgets_event_search_delegate/EventSearch/buildSuggestions.md)
to the
[query](../../widgets_event_search_delegate/EventSearch/query.md)
results returned by
[buildResults](../../widgets_event_search_delegate/EventSearch/buildResults.md).

If the user taps on a suggestion provided by
[buildSuggestions](../../widgets_event_search_delegate/EventSearch/buildSuggestions.md)
the screen should typically transition to the page showing the search
results for the suggested query. This transition can be triggered by
calling this method.

See also:

- [showSuggestions](../../widgets_event_search_delegate/EventSearch/showSuggestions.md)
  to show the search suggestions again.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
void showResults(BuildContext context) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_search_delegate](../../widgets_event_search_delegate/widgets_event_search_delegate-library.md)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  showResults method

##### EventSearch class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
