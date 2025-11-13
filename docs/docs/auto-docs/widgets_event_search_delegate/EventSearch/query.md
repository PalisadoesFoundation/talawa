<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [widgets/event_search_delegate.dart](../../widgets_event_search_delegate/widgets_event_search_delegate-library.md)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  query property

<div class="self-name">

query

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

# <span class="kind-property">query</span> property

</div>

<div id="getter" class="section">

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">query</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

The current query string shown in the `AppBar`.

The user manipulates this string via the keyboard.

If the user taps on a suggestion provided by
[buildSuggestions](../../widgets_event_search_delegate/EventSearch/buildSuggestions.md)
this string should be updated to that suggestion via the setter.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String get query => _queryTextController.text;
```

</div>

</div>

<div id="setter" class="section">

<div class="section multi-line-signature">

<span class="returntype">void</span>
<span class="name">query=</span><span class="signature">(<span id="query=-param-value"
class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
<span class="parameter-name">value</span></span>)</span>

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Changes the current query string.

Setting the query string programmatically moves the cursor to the end of
the text field.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
set query(String value) 
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
4.  query property

##### EventSearch class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
