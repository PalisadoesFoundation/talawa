<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [create_event_page](../../views_after_auth_screens_events_create_event_page/views_after_auth_screens_events_create_event_page-library.md)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  didUpdateWidget method

<div class="self-name">

didUpdateWidget

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="views_after_auth_screens_events_create_event_page/CreateEventPageState-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">didUpdateWidget</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[mustCallSuper](https://pub.dev/documentation/meta/1.16.0/meta/mustCallSuper-constant.html)
2.  @[protected](https://pub.dev/documentation/meta/1.16.0/meta/protected-constant.html)

</div>

<span class="returntype">void</span>
<span class="name">didUpdateWidget</span>(

1.  <span id="didUpdateWidget-param-oldWidget"
    class="parameter">covariant
    <span class="type-annotation">[CreateEventPage](../../views_after_auth_screens_events_create_event_page/CreateEventPage-class.md)</span>
    <span class="parameter-name">oldWidget</span></span>

)

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Called whenever the widget configuration changes.

If the parent widget rebuilds and requests that this location in the
tree update to display a new widget with the same
[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)
and `Widget.key`, the framework will update the
[widget](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/widget.md)
property of this `State` object to refer to the new widget and then call
this method with the previous widget as an argument.

Override this method to respond when the
[widget](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/widget.md)
changes (e.g., to start implicit animations).

The framework always calls
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
after calling
[didUpdateWidget](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/didUpdateWidget.md),
which means any calls to
[setState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/setState.md)
in
[didUpdateWidget](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/didUpdateWidget.md)
are redundant.

If a `State`'s
[build](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/build.md)
method depends on an object that can itself change state, for example a
`ChangeNotifier` or
[Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html),
or some other object to which one can subscribe to receive
notifications, then be sure to subscribe and unsubscribe properly in
[initState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/initState.md),
[didUpdateWidget](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/didUpdateWidget.md),
and
[dispose](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/dispose.md):

- In
  [initState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/initState.md),
  subscribe to the object.
- In
  [didUpdateWidget](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/didUpdateWidget.md)
  unsubscribe from the old object and subscribe to the new one if the
  updated widget configuration requires replacing the object.
- In
  [dispose](../../views_after_auth_screens_events_create_event_page/CreateEventPageState/dispose.md),
  unsubscribe from the object.

Implementations of this method should start with a call to the inherited
method, as in `super.didUpdateWidget(oldWidget)`.

*See the discussion at `Element.rebuild` for more information on when
this method is called.*

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@mustCallSuper
@protected
void didUpdateWidget(covariant T oldWidget) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [create_event_page](../../views_after_auth_screens_events_create_event_page/views_after_auth_screens_events_create_event_page-library.md)
3.  [CreateEventPageState](../../views_after_auth_screens_events_create_event_page/CreateEventPageState-class.md)
4.  didUpdateWidget method

##### CreateEventPageState class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
