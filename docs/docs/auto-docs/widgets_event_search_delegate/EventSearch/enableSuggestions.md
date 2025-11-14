<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [event_search_delegate](../../widgets_event_search_delegate/widgets_event_search_delegate-library.md)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  enableSuggestions property

<div class="self-name">

enableSuggestions

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

# <span class="kind-property">enableSuggestions</span> property

</div>

<div class="section multi-line-signature">

[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)
<span class="name">enableSuggestions</span>

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Whether to show input suggestions as the user types.

This flag only affects Android. On iOS, suggestions are tied directly to
[autocorrect](../../widgets_event_search_delegate/EventSearch/autocorrect.md),
so that suggestions are only shown when
[autocorrect](../../widgets_event_search_delegate/EventSearch/autocorrect.md)
is true. On Android autocorrection and suggestion are controlled
separately.

Defaults to true.

See also:

- [developer.android.com/reference/android/text/InputType.html#TYPE_TEXT_FLAG_NO_SUGGESTIONS](https://developer.android.com/reference/android/text/InputType.html#TYPE_TEXT_FLAG_NO_SUGGESTIONS)

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
final bool enableSuggestions;
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_search_delegate](../../widgets_event_search_delegate/widgets_event_search_delegate-library.md)
3.  [EventSearch](../../widgets_event_search_delegate/EventSearch-class.md)
4.  enableSuggestions property

##### EventSearch class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
