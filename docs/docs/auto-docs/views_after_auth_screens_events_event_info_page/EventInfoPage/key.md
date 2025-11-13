<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [views/after_auth_screens/events/event_info_page.dart](../../views_after_auth_screens_events_event_info_page/views_after_auth_screens_events_event_info_page-library.md)
3.  [EventInfoPage](../../views_after_auth_screens_events_event_info_page/EventInfoPage-class.md)
4.  key property

<div class="self-name">

key

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_events_event_info_page/EventInfoPage-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-property">key</span> property

</div>

<div class="section multi-line-signature">

Key? <span class="name">key</span>

<div class="features">

<span class="feature">final</span><span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Controls how one widget replaces another widget in the tree.

If the
[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
and
[key](../../views_after_auth_screens_events_event_info_page/EventInfoPage/key.md)
properties of the two widgets are
[operator==](../../views_after_auth_screens_events_event_info_page/EventInfoPage/operator_equals.md),
respectively, then the new widget replaces the old widget by updating
the underlying element (i.e., by calling `Element.update` with the new
widget). Otherwise, the old element is removed from the tree, the new
widget is inflated into an element, and the new element is inserted into
the tree.

In addition, using a `GlobalKey` as the widget's
[key](../../views_after_auth_screens_events_event_info_page/EventInfoPage/key.md)
allows the element to be moved around the tree (changing parent) without
losing state. When a new widget is found (its key and type do not match
a previous widget in the same location), but there was a widget with
that same global key elsewhere in the tree in the previous frame, then
that widget's element is moved to the new location.

Generally, a widget that is the only child of another widget does not
need an explicit key.

See also:

- The discussions at `Key` and `GlobalKey`.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
final Key? key;
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [event_info_page](../../views_after_auth_screens_events_event_info_page/views_after_auth_screens_events_event_info_page-library.md)
3.  [EventInfoPage](../../views_after_auth_screens_events_event_info_page/EventInfoPage-class.md)
4.  key property

##### EventInfoPage class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
